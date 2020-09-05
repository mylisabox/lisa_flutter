import 'dart:async';

import 'package:jaguar_retrofit/annotations/annotations.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'setup_api.jretro.dart';

@GenApiClient()
class SetupApi extends ApiClient with _$SetupApiClient {
    final Route base;
    final Map<String, CodecRepo> converters;
    final Duration timeout;

    SetupApi({this.base, this.converters, this.timeout = const Duration(minutes: 2)});

    ///
    ///
    ///
    @PostReq(path: "/api/v1/setup/voice_commands", metadata: {"auth": [ {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header" }]})
    Future<void> setupVoiceCommands(

            @AsMultipartField() MultipartFile config
        ) {
        return super.setupVoiceCommands(


        config
        ).timeout(timeout);
    }


}
