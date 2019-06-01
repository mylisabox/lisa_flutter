// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scene_api.dart';

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$SceneApiClient implements ApiClient {
  final String basePath = "";
  Future<void> deleteScene(String scene) async {
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
        .path("/api/v1/chatbot/userBot/:scene")
        .pathParams("scene", scene);
    await req.go(throwOnErr: true);
  }

  Future<List<Scene>> getScene() async {
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
        .path("/api/v1/chatbot/userBot");
    return req.go(throwOnErr: true).map(decodeList);
  }

  Future<void> saveScene(Scene scene) async {
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
        .path("/api/v1/chatbot/userBot")
        .json(jsonConverter.to(scene));
    await req.go(throwOnErr: true);
  }
}
