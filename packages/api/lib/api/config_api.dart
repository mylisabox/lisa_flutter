import 'package:jaguar_retrofit/annotations/annotations.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_mimetype/jaguar_mimetype.dart';
import 'dart:async';

import 'package:lisa_server_sdk/model/is_initialized.dart';

part 'config_api.jretro.dart';

@GenApiClient()
class ConfigApi extends ApiClient with _$ConfigApiClient {
    final Route base;
    final Map<String, CodecRepo> converters;
    final Duration timeout;

    ConfigApi({this.base, this.converters, this.timeout = const Duration(minutes: 2)});

    /// 
    ///
    /// 
    @GetReq(path: "/api/v1/initialized", metadata: {"auth": [ {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header" }]})
    Future<IsInitialized> isInitialized(
        ) {
        return super.isInitialized(

        ).timeout(timeout);
    }


}
