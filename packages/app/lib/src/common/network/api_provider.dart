
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/network/local_server_provider.dart';
import 'package:lisa_flutter/src/common/stores/user_store.dart';
import 'package:lisa_flutter/src/common/utils/page_route_builders.dart';
import 'package:lisa_flutter/src/login/presentation/login_screen.dart';
import 'package:lisa_flutter/src/preferences/preferences_provider.dart';
import 'package:lisa_server_sdk/lisa_server_sdk.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  bool logoutInProgress = false;

  LogoutInterceptor(this.navigatorKey, this.userStore);

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    //backend tell us our token is not good anymore, let's logout in that case
    if (response.statusCode == 401 && !response.requestOptions.uri.path.contains('logout') && !logoutInProgress) {
      logoutInProgress = true;
      await userStore().logout();
      navigatorKey.currentState?.pushAndRemoveUntil(
          FromBottomPageRoute(
            builder: (_) => LoginScreen(),
            settings: RouteSettings(name: LoginScreen.route),
          ),
          (route) => true);
    } else if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
      logoutInProgress = false;
    }

    handler.next(response);
  }
}

List<Interceptor> getInterceptors({required GlobalKey<NavigatorState> navigatorKey, required UserStore Function() userStore}) => kNetworkDebug
    ? [HostInterceptor(), ApiKeyAuthInterceptor(), LogInterceptor(requestBody: true, responseBody: true), LogoutInterceptor(navigatorKey, userStore)]
    : <Interceptor>[HostInterceptor(), ApiKeyAuthInterceptor(), LogoutInterceptor(navigatorKey, userStore)];

class BackendApiProvider {
  final LisaServerSdk api;

  factory BackendApiProvider() => _singleton;

  BackendApiProvider._(List<Interceptor> interceptors, String baseUrl) : api = LisaServerSdk(basePathOverride: baseUrl, interceptors: interceptors);

  void clearHost() {
    final hostInterceptor = api.dio.interceptors.firstWhere((element) => element is HostInterceptor);
    (hostInterceptor as HostInterceptor).clearHost();
  }

  // ignore: prefer_constructors_over_static_methods
  static BackendApiProvider setup(GlobalKey<NavigatorState> navigatorKey, UserStore Function() userStore, SharedPreferences preferences, {required String baseUrl, List<Interceptor>? interceptors}) {
    interceptors ??= getInterceptors(navigatorKey: navigatorKey, userStore: userStore);
    _singleton = BackendApiProvider._(interceptors, baseUrl);
    _singleton.api.dio.options.headers['Accept'] = 'application/json';
    final token = preferences.getString(PreferencesProvider.keyToken);

    if (token != null) {
      _singleton.api.setApiKey(kAuthKey, 'JWT $token');
    }
    return _singleton;
  }

  static late BackendApiProvider _singleton;

  static BackendApiProvider get instance => _singleton;
}
