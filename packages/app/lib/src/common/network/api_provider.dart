import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/network/local_server_provider.dart';
import 'package:lisa_flutter/src/common/network/websocket_manager.dart';
import 'package:lisa_flutter/src/common/stores/user_store.dart';
import 'package:lisa_flutter/src/common/utils/page_route_builders.dart';
import 'package:lisa_flutter/src/login/presentation/login_screen.dart';
import 'package:lisa_flutter/src/preferences/preferences_provider.dart';
import 'package:lisa_server_sdk/lisa_server_sdk.dart';
import 'package:logging/logging.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';

class HostInterceptor extends Interceptor {
  final _log = Logger('HostInterceptor');
  final Connectivity _connectivity;
  final PreferencesProvider _preferencesProvider;
  final LocalServerProvider _serverProvider;
  String? _host;
  ConnectivityResult? _previousConnectivity;
  String? _previousWifiIp;

  String? get host => _host;

  HostInterceptor({
    Connectivity? connectivity,
    LocalServerProvider? serverProvider,
    PreferencesProvider? preferencesProvider,
  })  : _connectivity = connectivity ?? Connectivity(),
        _serverProvider = serverProvider ?? LocalServerProvider.create(),
        _preferencesProvider = preferencesProvider ?? PreferencesProvider() {
    if (!kIsWeb) {
      _connectivity.onConnectivityChanged.listen((connectivityResult) async {
        if (_previousConnectivity != connectivityResult) {
          _host = null; //reset host to trigger another search on next request
        } else if (connectivityResult == ConnectivityResult.wifi) {
          final ip = await WifiInfo().getWifiIP();
          if (_previousWifiIp != ip) {
            _host = null; //reset host to trigger another search on next request because we change wifi network
            _previousWifiIp = ip;
          }
        }

        _previousConnectivity = connectivityResult;
      });
    }
  }

  void clearHost() {
    _host = null;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (_host == null) {
      final prefExternalUrl = _preferencesProvider.prefs.getString(PreferencesProvider.keyExternalUrl) ?? options.uri.toString();
      if (!kIsWeb) {
        var connectivityResult = await (_connectivity.checkConnectivity());
        if (connectivityResult == ConnectivityResult.mobile) {
          _setExternalUrl(options, prefExternalUrl);
        } else if (connectivityResult == ConnectivityResult.wifi) {
          final localServer = await _serverProvider.search().catchError((err) {
            return '';
          });
          _log.info('lisa host found at $localServer');
          if (localServer.isEmpty) {
            _setExternalUrl(options, prefExternalUrl);
          } else {
            _setExternalUrl(options, localServer);
          }
        }
      } else {
        // We're on desktop so let's search locally first
        final localServer = await _serverProvider.search().catchError((err) {
          return '';
        });
        if (localServer.isEmpty) {
          _setExternalUrl(options, prefExternalUrl);
        } else {
          _setExternalUrl(options, localServer);
        }
      }
    } else {
      _setExternalUrl(options, _host!);
    }
    _log.info('lisa host set to $_host');
    handler.next(options);
  }

  _setExternalUrl(RequestOptions options, String externalUrl) {
    final urlParts = options.uri;
    final externalUrlParts = Uri.parse(externalUrl);
    if (urlParts.scheme == externalUrlParts.scheme && urlParts.host == externalUrlParts.host && urlParts.port == externalUrlParts.port) {
      if (_host == null) {
        _host = externalUrlParts.origin;
      }
      return;
    }

    final finalUrl = urlParts.replace(host: externalUrlParts.host, scheme: externalUrlParts.scheme, port: externalUrlParts.port);
    _host = externalUrlParts.origin;
    options.path = finalUrl.toString();
  }
}

class LogoutInterceptor extends Interceptor {
  final GlobalKey<NavigatorState> navigatorKey;
  final UserStore Function() userStore;
  final AuthApi Function() _authApi;
  final PreferencesProvider _preferenceProvider;

  LogoutInterceptor(this.navigatorKey, this.userStore, this._authApi, this._preferenceProvider);

  void _logout(bool redirectToLogin) async {
    await userStore().logout();
    if (redirectToLogin) {
      navigatorKey.currentState?.pushAndRemoveUntil(
          FromBottomPageRoute(
            builder: (_) => LoginScreen(),
            settings: RouteSettings(name: LoginScreen.route),
          ),
              (route) => true);
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    //backend tell us our token is not good anymore, let's logout in that case
    if (err.response?.statusCode == 401 && !err.requestOptions.uri.path.contains('/auth/')) {
      try {
        final result = await _authApi().refreshToken(
            refreshTokenRequest: (RefreshTokenRequestBuilder()
                  ..refreshToken = await _preferenceProvider.securePrefs.read(
                    key: PreferencesProvider.keyRefreshToken,
                  ))
                .build());
        final token = result.data!.token;
        await _preferenceProvider.securePrefs.write(key: PreferencesProvider.keyToken, value: token);
        BackendApiProvider().setToken(token);
        err.requestOptions.headers["Authorization"] = 'Token $token';
        //create request with new access token
        final opts = new Options(method: err.requestOptions.method, headers: err.requestOptions.headers);
        final response = await BackendApiProvider().api.dio.request(
              err.requestOptions.path,
              options: opts,
              data: err.requestOptions.data,
              queryParameters: err.requestOptions.queryParameters,
            );

        return handler.resolve(response);
      } catch (err, stack) {
        _logout(true);
      }
    } else if (err.response?.statusCode == 401) {
      _logout(false);
    }

    handler.next(err);
  }
}

final _logPrint = Logger('network').info;

List<Interceptor> getInterceptors({
  required GlobalKey<NavigatorState> navigatorKey,
  required UserStore Function() userStore,
  required AuthApi Function() authApi,
  required PreferencesProvider preferenceProvider,
}) =>
    kNetworkDebug
        ? [
            HostInterceptor(),
            ApiKeyAuthInterceptor(),
            LogInterceptor(logPrint: _logPrint, requestBody: true, responseBody: true),
            LogoutInterceptor(
              navigatorKey,
              userStore,
              authApi,
              preferenceProvider,
            )
          ]
        : <Interceptor>[
            HostInterceptor(),
            ApiKeyAuthInterceptor(),
            LogoutInterceptor(
              navigatorKey,
              userStore,
              authApi,
              preferenceProvider,
            )
          ];

class BackendApiProvider {
  final LisaServerSdk api;
  final WebsocketManager websocketManager = WebsocketManager();

  factory BackendApiProvider() => _singleton;

  BackendApiProvider._(List<Interceptor> interceptors, String baseUrl) : api = LisaServerSdk(basePathOverride: baseUrl, interceptors: interceptors);

  void clearHost() {
    final hostInterceptor = api.dio.interceptors.firstWhere((element) => element is HostInterceptor);
    (hostInterceptor as HostInterceptor).clearHost();
  }

  String getToken() {
    return (api.dio.interceptors.firstWhere((element) => element is ApiKeyAuthInterceptor) as ApiKeyAuthInterceptor).apiKeys[kAuthKey]!.replaceFirst('Token', '').trim();
  }

  void setToken(String token) {
    api.setApiKey(kAuthKey, 'Token $token');
  }

  void setupWebsocket() {
    websocketManager.setup(getToken());
  }

  // ignore: prefer_constructors_over_static_methods
  static BackendApiProvider setup(
    GlobalKey<NavigatorState> navigatorKey,
    UserStore Function() userStore,
    PreferencesProvider preferencesProvider, {
    required String baseUrl,
    List<Interceptor>? interceptors,
  }) {
    interceptors ??= getInterceptors(
      navigatorKey: navigatorKey,
      userStore: userStore,
      authApi: () => BackendApiProvider().api.getAuthApi(),
      preferenceProvider: preferencesProvider,
    );
    _singleton = BackendApiProvider._(interceptors, baseUrl);
    _singleton.api.dio.options.headers['Accept'] = 'application/json';
    final token = preferencesProvider.prefs.getString(PreferencesProvider.keyToken);

    if (token != null) {
      _singleton.setToken(token);
    }
    return _singleton;
  }

  static late BackendApiProvider _singleton;

  static BackendApiProvider get instance => _singleton;
}
