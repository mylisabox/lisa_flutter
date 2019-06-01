import 'package:jaguar_retrofit/annotations/annotations.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_mimetype/jaguar_mimetype.dart';
import 'dart:async';

import 'package:lisa_server_sdk/model/scene.dart';

part 'scene_api.jretro.dart';

@GenApiClient()
class SceneApi extends ApiClient with _$SceneApiClient {
    final Route base;
    final Map<String, CodecRepo> converters;
    final Duration timeout;

    SceneApi({this.base, this.converters, this.timeout = const Duration(minutes: 2)});

    /// 
    ///
    /// 
    @DeleteReq(path: "/api/v1/chatbot/userBot/:scene", metadata: {"auth": [ {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header" }]})
    Future<void> deleteScene(
            @PathParam("scene") String scene
        ) {
        return super.deleteScene(
        scene

        ).timeout(timeout);
    }

    /// 
    ///
    /// 
    @GetReq(path: "/api/v1/chatbot/userBot", metadata: {"auth": [ {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header" }]})
    Future<List<Scene>> getScene(
        ) {
        return super.getScene(

        ).timeout(timeout);
    }

    /// 
    ///
    /// 
    @PostReq(path: "/api/v1/chatbot/userBot", metadata: {"auth": [ {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header" }]})
    Future<void> saveScene(
            
             @AsJson() Scene scene
        ) {
        return super.saveScene(

        
        scene
        ).timeout(timeout);
    }


}
