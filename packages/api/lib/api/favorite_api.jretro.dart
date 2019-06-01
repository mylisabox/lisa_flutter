// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_api.dart';

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$FavoriteApiClient implements ApiClient {
  final String basePath = "";
  Future<void> addToFavorite(int deviceId) async {
    var req = base.put
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
        .path("/api/v1/favorite/:deviceId")
        .pathParams("deviceId", deviceId);
    await req.go(throwOnErr: true);
  }

  Future<void> deleteFromFavorite(int deviceId) async {
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
        .path("/api/v1/favorite/:deviceId")
        .pathParams("deviceId", deviceId);
    await req.go(throwOnErr: true);
  }

  Future<List<Device>> getFavorites() async {
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
        .path("/api/v1/favorite");
    return req.go(throwOnErr: true).map(decodeList);
  }
}
