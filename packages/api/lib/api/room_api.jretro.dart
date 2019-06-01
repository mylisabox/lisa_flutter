// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_api.dart';

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$RoomApiClient implements ApiClient {
  final String basePath = "";
  Future<void> addRoom(Room room) async {
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
        .path("/api/v1/room")
        .json(jsonConverter.to(room));
    await req.go(throwOnErr: true);
  }

  Future<void> deleteRoom(int roomId) async {
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
        .path("/api/v1/room/:roomId")
        .pathParams("roomId", roomId);
    await req.go(throwOnErr: true);
  }

  Future<List<Room>> getRooms() async {
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
        .path("/api/v1/room");
    return req.go(throwOnErr: true).map(decodeList);
  }

  Future<void> saveRoom(int roomId, Room room) async {
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
        .path("/api/v1/room/:roomId")
        .pathParams("roomId", roomId)
        .json(jsonConverter.to(room));
    await req.go(throwOnErr: true);
  }
}
