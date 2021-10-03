import 'package:lisa_flutter/src/common/network/api_provider.dart';

mixin BaseUrlProvider {
  static String _getHost() {
    final interceptor = BackendApiProvider().api.dio.interceptors.firstWhere((item) => item is HostInterceptor); //get host interceptor
    return (interceptor as HostInterceptor).host!;
  }
  static String getBaseUrl() => _getHost();

  String get baseUrl => _getHost();
  String get baseApiUrl => _getHost() + '/api/v1';
  String get baseWebsocketUrl => _getHost().replaceFirst('http://', 'ws://').replaceFirst('https://', 'wss://');
  String getPluginImageUrl(String pluginId, String path) => '$baseApiUrl/plugins/images/$pluginId/$path';

  String prefixHostIfNeeded(String path) => (path.startsWith('http') ? '' : baseApiUrl) + '$path';

  String getProxyUrl() => baseApiUrl + '/proxy?';
}
