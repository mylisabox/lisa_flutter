// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatbot_api.dart';

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$ChatbotApiClient implements ApiClient {
  final String basePath = "";
  Future<InteractResponse> interact(InteractRequest interactRequest) async {
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
        .path("/api/v1/chatbot/interact")
        .json(jsonConverter.to(interactRequest));
    return req.go(throwOnErr: true).map(decodeOne);
  }
}
