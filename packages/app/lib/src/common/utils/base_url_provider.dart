import 'package:lisa_flutter/src/common/network/api_provider.dart';

mixin BaseUrlProvider {
  String get baseUrl => BackendApiProvider().api.basePath;
  String get baseApiUrl => BackendApiProvider().api.basePath + '/api/v1';
  String getPluginImageUrl(String pluginId, String path) => BackendApiProvider().api.basePath + '/api/v1/plugin/$pluginId/images/$path';
}
