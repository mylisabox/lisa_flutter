import 'dart:async';

import 'package:jaguar_retrofit/annotations/annotations.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:lisa_server_sdk/model/device.dart';

part 'favorite_api.jretro.dart';

@GenApiClient()
class FavoriteApi extends ApiClient with _$FavoriteApiClient {
  final Route base;
  final Map<String, CodecRepo> converters;
  final Duration timeout;

  FavoriteApi({this.base, this.converters, this.timeout = const Duration(minutes: 2)});

  ///
  ///
  ///
  @PutReq(path: "/api/v1/favorite/:deviceId", metadata: {
    "auth": [
      {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header"}
    ]
  })
  Future<void> addToFavorite(@PathParam("deviceId") int deviceId) {
    return super.addToFavorite(deviceId).timeout(timeout);
  }

  ///
  ///
  ///
  @DeleteReq(path: "/api/v1/favorite/:deviceId", metadata: {
    "auth": [
      {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header"}
    ]
  })
  Future<void> deleteFromFavorite(@PathParam("deviceId") int deviceId) {
    return super.deleteFromFavorite(deviceId).timeout(timeout);
  }

  ///
  ///
  ///
  @GetReq(path: "/api/v1/favorite", metadata: {
    "auth": [
      {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header"}
    ]
  })
  Future<List<Device>> getFavorites() {
    return super.getFavorites().timeout(timeout);
  }
}
