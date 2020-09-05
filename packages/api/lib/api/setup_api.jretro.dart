// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setup_api.dart';

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$SetupApiClient implements ApiClient {
  final String basePath = "";
  Future<void> setupVoiceCommands(MultipartFile config) async {
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
        .path("/api/v1/setup/voice_commands")
        .multipart({"config": config});
    await req.go(throwOnErr: true);
  }
}
