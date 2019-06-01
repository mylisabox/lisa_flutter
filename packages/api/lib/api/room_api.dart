import 'package:jaguar_retrofit/annotations/annotations.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_mimetype/jaguar_mimetype.dart';
import 'dart:async';

import 'package:lisa_server_sdk/model/room.dart';

part 'room_api.jretro.dart';

@GenApiClient()
class RoomApi extends ApiClient with _$RoomApiClient {
    final Route base;
    final Map<String, CodecRepo> converters;
    final Duration timeout;

    RoomApi({this.base, this.converters, this.timeout = const Duration(minutes: 2)});

    /// 
    ///
    /// 
    @PostReq(path: "/api/v1/room", metadata: {"auth": [ {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header" }]})
    Future<void> addRoom(
            
             @AsJson() Room room
        ) {
        return super.addRoom(

        
        room
        ).timeout(timeout);
    }

    /// 
    ///
    /// 
    @DeleteReq(path: "/api/v1/room/:roomId", metadata: {"auth": [ {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header" }]})
    Future<void> deleteRoom(
            @PathParam("roomId") int roomId
        ) {
        return super.deleteRoom(
        roomId

        ).timeout(timeout);
    }

    /// 
    ///
    /// 
    @GetReq(path: "/api/v1/room", metadata: {"auth": [ {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header" }]})
    Future<List<Room>> getRooms(
        ) {
        return super.getRooms(

        ).timeout(timeout);
    }

    /// 
    ///
    /// 
    @PutReq(path: "/api/v1/room/:roomId", metadata: {"auth": [ {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header" }]})
    Future<void> saveRoom(
            @PathParam("roomId") int roomId
            ,
             @AsJson() Room room
        ) {
        return super.saveRoom(
        roomId

        ,
        room
        ).timeout(timeout);
    }


}
