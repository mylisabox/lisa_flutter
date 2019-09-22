// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_api.dart';

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$LoginApiClient implements ApiClient {
  final String basePath = "";
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    var req = base.post
        .path(basePath)
        .path("/api/v1/auth/local")
        .json(jsonConverter.to(loginRequest));
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<void> logout() async {
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
        .path("/api/v1/auth/logout");
    await req.go(throwOnErr: true);
  }

  Future<LoginResponse> register(LoginRequest loginRequest) async {
    var req = base.post
        .path(basePath)
        .path("/api/v1/auth/local/register")
        .json(jsonConverter.to(loginRequest));
    return req.go(throwOnErr: true).map(decodeOne);
  }
}
