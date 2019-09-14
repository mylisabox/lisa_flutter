import 'package:jaguar_retrofit/annotations/annotations.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_mimetype/jaguar_mimetype.dart';
import 'dart:async';

import 'package:lisa_server_sdk/model/interact_request.dart';
import 'package:lisa_server_sdk/model/interact_response.dart';

part 'chatbot_api.jretro.dart';

@GenApiClient()
class ChatbotApi extends ApiClient with _$ChatbotApiClient {
    final Route base;
    final Map<String, CodecRepo> converters;
    final Duration timeout;

    ChatbotApi({this.base, this.converters, this.timeout = const Duration(minutes: 2)});

    /// 
    ///
    /// 
    @PostReq(path: "/api/v1/chatbot/interact", metadata: {"auth": [ {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header" }]})
    Future<InteractResponse> interact(
            
             @AsJson() InteractRequest interactRequest
        ) {
        return super.interact(

        
        interactRequest
        ).timeout(timeout);
    }


}
