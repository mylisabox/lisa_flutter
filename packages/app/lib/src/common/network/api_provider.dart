import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:lisa_flutter/src/common/config.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/network/local_server_provider.dart';
import 'package:lisa_flutter/src/common/utils/page_route_builders.dart';
import 'package:lisa_flutter/src/login/presentation/login_screen.dart';
import 'package:lisa_flutter/src/preferences/preferences_provider.dart';
import 'package:lisa_server_sdk/api.dart';
import 'package:logging/logging.dart';

class HostInterceptor extends Interceptor {
  final _log = Logger('HostInterceptor');
  final Connectivity _connectivity;
  final PreferencesProvider _preferencesProvider;
  final LocalServerProvider _serverProvider;
  String _host;
  ConnectivityResult _previousConnectivity;
  String _previousWifiIp;

  String get host => _host;

  HostInterceptor({
    Connectivity connectivity,
    LocalServerProvider serverProvider,
    PreferencesProvider preferencesProvider,
  })  : _connectivity = connectivity ?? Connectivity(),
        _serverProvider = serverProvider ?? LocalServerProvider.create(),
        _preferencesProvider = preferencesProvider ?? PreferencesProvider() {
    if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android) {
      _connectivity.onConnectivityChanged.listen((connectivityResult) async {
        if (_previousConnectivity != connectivityResult) {
          _host = null; //reset host to trigger another search on next request
        } else if (connectivityResult == ConnectivityResult.wifi) {
          final ip = await connectivity.getWifiIP();
          if (_previousWifiIp != ip) {
            _host = null; //reset host to trigger another search on next request because we change wifi network
          }
        }

        _previousConnectivity = connectivityResult;
      });
    }
  }

  @override
  FutureOr<void> before(RouteBase route) async {
    final url = route.getUrl;
    if (_host == null) {
      final prefExternalUrl = _preferencesProvider.prefs.getString(PreferencesProvider.keyExternalUrl, defaultValue: url);
      if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android) {
        var connectivityResult = await (_connectivity.checkConnectivity());
        if (connectivityResult == ConnectivityResult.mobile) {
          _setExternalUrl(route, prefExternalUrl);
        } else if (connectivityResult == ConnectivityResult.wifi) {
          final localServer = await _serverProvider.search().catchError((err) {
            return 'http://localhost:3000'; //FIXME don't return dev value ^^
          });
          _log.info('lisa host found at $localServer');
          if (localServer == null) {
            _setExternalUrl(route, prefExternalUrl);
          } else {
            _setExternalUrl(route, localServer);
          }
        }
      } else {
        // We're on desktop so let's search locally first
        final localServer = await _serverProvider.search();
        if (localServer == null) {
          _setExternalUrl(route, prefExternalUrl);
        } else {
          _setExternalUrl(route, localServer);
        }
      }
    } else {
      _setExternalUrl(route, _host);
    }

    return null;
  }

  _setExternalUrl(RouteBase route, String externalUrl) {
    final urlParts = Uri.parse(route.getUrl);
    final externalUrlParts = Uri.parse(externalUrl);
    if (urlParts.scheme == externalUrlParts.scheme && urlParts.host == externalUrlParts.host && urlParts.port == externalUrlParts.port) {
      if (_host == null) {
        _host = externalUrlParts.origin;
      }
      return;
    }

    final finalUrl = urlParts.replace(host: externalUrlParts.host, scheme: externalUrlParts.scheme, port: externalUrlParts.port);
    _host = externalUrlParts.origin;
    route.url(externalUrlParts.toString()); //FIXME use finalUrl https://github.com/Jaguar-dart/client/issues/53
  }

  @override
  FutureOr after(StringResponse response) {
    return response;
  }
}

class LogInterceptor extends Interceptor {
  static final _log = Logger('Network');

  @override
  FutureOr<void> before(RouteBase route) {
    _log.fine('==> ${route.runtimeType.toString().toUpperCase()} ${route.getUrl}');
    route.getHeaders.forEach((key, value) => _log.fine('==> $key: $value'));
    if (route is RouteWithBody) {
      _log.fine('\n${route.getBody()}');
    }
    return null;
  }

  @override
  FutureOr after(StringResponse response) {
    _log.fine('<== ${response.statusCode} ${response.request.url}');
    response.headers.forEach((key, value) => _log.fine('<== $key: $value'));
    _log.fine('\n${response.body}');
    return response;
  }
}

class LogoutInterceptor extends Interceptor {
  final GlobalKey<NavigatorState> navigatorKey;

  LogoutInterceptor(this.navigatorKey);

  @override
  FutureOr after(StringResponse response) {
    //backend tell us our token is not good anymore, let's logout in that case
    if (response.statusCode == 401) {
      BackendApiProvider().api.setApiKey('Authorization', null);
      navigatorKey.currentState.pushAndRemoveUntil(
          FromBottomPageRoute(
            builder: (_) => LoginScreen(),
            settings: RouteSettings(name: LoginScreen.route),
          ),
          (route) => true);
    }

    return response;
  }
}

List<Interceptor> getInterceptors({GlobalKey<NavigatorState> navigatorKey}) =>
    kNetworkDebug ? [HostInterceptor(), LogInterceptor(), LogoutInterceptor(navigatorKey)] : <Interceptor>[HostInterceptor(), LogoutInterceptor(navigatorKey)];

class BackendApiProvider {
  static const connectionTimeout = 30;
  static const httpTimeout = Duration(minutes: 2);
  final LisaServerSdk api;
  final List<Interceptor> interceptors;

  factory BackendApiProvider() => _singleton;

  BackendApiProvider._(this.interceptors, String baseUrl) : api = LisaServerSdk(baseUrl: baseUrl, interceptors: interceptors, timeout: httpTimeout);

  // ignore: prefer_constructors_over_static_methods
  static BackendApiProvider setup(GlobalKey<NavigatorState> navigatorKey, {String baseUrl, List<Interceptor> interceptors}) {
    baseUrl ??= Config.kUrl;
    interceptors ??= getInterceptors(navigatorKey: navigatorKey);

    globalClient = http.Client();

    return _singleton = BackendApiProvider._(interceptors, baseUrl);
  }

  static BackendApiProvider _singleton;

  static BackendApiProvider get instance => _singleton;
}
