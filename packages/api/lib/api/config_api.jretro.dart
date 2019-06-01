// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_api.dart';

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$ConfigApiClient implements ApiClient {
  final String basePath = "";
  Future<IsInitialized> isInitialized() async {
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
        .path("/api/v1/initialized");
    return req.go(throwOnErr: true).map(decodeOne);
  }
}
