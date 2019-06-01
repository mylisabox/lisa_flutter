// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_api.dart';

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$DashboardApiClient implements ApiClient {
  final String basePath = "";
  Future<Dashboard> getDashboard(int roomId) async {
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
        .path("/api/v1/dashboard/room/:roomId")
        .pathParams("roomId", roomId);
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<void> saveDashboard(int roomId, List<int> requestBody) async {
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
        .path("/api/v1/dashboard/room/:roomId")
        .pathParams("roomId", roomId)
        .json(jsonConverter.to(requestBody));
    await req.go(throwOnErr: true);
  }
}
