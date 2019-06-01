// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_api.dart';

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$UserApiClient implements ApiClient {
  final String basePath = "";
  Future<User> getProfile() async {
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
        .path("/api/v1/user");
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<User> saveProfile(
      int id,
      String email,
      String firstname,
      String lang,
      String lastname,
      String mobile,
      String password,
      MultipartFile avatar) async {
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
        .path("/api/v1/user")
        .multipart({"id": id})
        .multipart({"email": email})
        .multipart({"firstname": firstname})
        .multipart({"lang": lang})
        .multipart({"lastname": lastname})
        .multipart({"mobile": mobile})
        .multipart({"password": password})
        .multipart({"avatar": avatar});
    return req.go(throwOnErr: true).map(decodeOne);
  }
}
