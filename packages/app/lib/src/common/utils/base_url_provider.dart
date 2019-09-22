import 'package:lisa_flutter/src/common/network/api_provider.dart';

mixin BaseUrlProvider {
  String _getHost() {
    final HostInterceptor interceptor = BackendApiProvider().interceptors.first; //get host interceptor
    return interceptor.host;
  }

  String get baseUrl => _getHost();
  String get baseApiUrl => _getHost() + '/api/v1';
  String getPluginImageUrl(String pluginId, String path) => _getHost() + '/api/v1/plugin/$pluginId/images/$path';

  String prefixHostIfNeeded(String path) => (path.startsWith('http') ? '' : baseApiUrl) + '$path';
}
