import 'package:lisa_flutter/src/common/network/api_provider.dart';

mixin BaseUrlProvider {
  static String _getHost() {
    final HostInterceptor interceptor = BackendApiProvider().api.dio.interceptors.firstWhere((item) => item is HostInterceptor); //get host interceptor
    return interceptor.host;
  }
  static String getBaseUrl() => _getHost();

  String get baseUrl => _getHost();
  String get baseApiUrl => _getHost() + '/api/v1';
  String getPluginImageUrl(String pluginId, String path) => _getHost() + '/api/v1/plugin/$pluginId/images/$path';

  String prefixHostIfNeeded(String path) => (path.startsWith('http') ? '' : baseApiUrl) + '$path';

  String getProxyUrl() => baseApiUrl + '/proxy?';
}
