// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plugin_api.dart';

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$PluginApiClient implements ApiClient {
  final String basePath = "";
  Future<List<StorePlugin>> getStorePlugins() async {
    var req = base.get
        .metadata({
          "auth": [
            {
              "type": "apiKey",
              "name": "Bearer",
              "keyName": "Authorization",
              "where": "header",
            }
          ],
        })
        .path(basePath)
        .path("/api/v1/plugin/store");
    return req.go(throwOnErr: true).map(decodeList);
  }

  Future<void> installPlugin(AddPluginRequest addPluginRequest) async {
    var req = base.post
        .metadata({
          "auth": [
            {
              "type": "apiKey",
              "name": "Bearer",
              "keyName": "Authorization",
              "where": "header",
            }
          ],
        })
        .path(basePath)
        .path("/api/v1/plugin/install")
        .json(jsonConverter.to(addPluginRequest));
    await req.go(throwOnErr: true);
  }

  Future<Map<String, Object>> pairing(
      String pluginName, String driver, Map<String, Object> requestBody) async {
    var req = base.post
        .metadata({
          "auth": [
            {
              "type": "apiKey",
              "name": "Bearer",
              "keyName": "Authorization",
              "where": "header",
            }
          ],
        })
        .path(basePath)
        .path("/api/v1/plugin/:pluginName/drivers/:driver/pairing")
        .pathParams("pluginName", pluginName)
        .pathParams("driver", driver)
        .json(jsonConverter.to(requestBody));
    return req
        .go()
        .map((r) => jsonConverter.decode(r.body).cast<String, int>());
  }

  Future<List<Plugin>> searchPlugins(String query, bool activated) async {
    var req = base.get
        .metadata({
          "auth": [
            {
              "type": "apiKey",
              "name": "Bearer",
              "keyName": "Authorization",
              "where": "header",
            }
          ],
        })
        .path(basePath)
        .path("/api/v1/plugin/search")
        .query("query", query)
        .query("activated", activated);
    return req.go(throwOnErr: true).map(decodeList);
  }

  Future<void> uninstallPlugin(String pluginName) async {
    var req = base.delete
        .metadata({
          "auth": [
            {
              "type": "apiKey",
              "name": "Bearer",
              "keyName": "Authorization",
              "where": "header",
            }
          ],
        })
        .path(basePath)
        .path("/api/v1/plugin/:pluginName/uninstall")
        .pathParams("pluginName", pluginName);
    await req.go(throwOnErr: true);
  }
}
