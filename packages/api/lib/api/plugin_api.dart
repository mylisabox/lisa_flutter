import 'package:jaguar_retrofit/annotations/annotations.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_mimetype/jaguar_mimetype.dart';
import 'dart:async';

import 'package:lisa_server_sdk/model/plugin.dart';
import 'package:lisa_server_sdk/model/pairing_response.dart';

part 'plugin_api.jretro.dart';

@GenApiClient()
class PluginApi extends ApiClient with _$PluginApiClient {
    final Route base;
    final Map<String, CodecRepo> converters;
    final Duration timeout;

    PluginApi({this.base, this.converters, this.timeout = const Duration(minutes: 2)});

    /// 
    ///
    /// 
    @PostReq(path: "/api/v1/plugin/:pluginName/drivers/:driver/pairing", metadata: {"auth": [ {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header" }]})
    Future<PairingResponse> pairing(
            @PathParam("pluginName") String pluginName, 
            @PathParam("driver") String driver
            ,
             @AsJson() Map<String, Object> requestBody
        ) {
        return super.pairing(
        pluginName, 
        driver

        ,
        requestBody
        ).timeout(timeout);
    }

    /// 
    ///
    /// 
    @GetReq(path: "/api/v1/plugin/search", metadata: {"auth": [ {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header" }]})
    Future<List<Plugin>> searchPlugins(
        
            @QueryParam("query") String query, 
        
            @QueryParam("activated") bool activated
        ) {
        return super.searchPlugins(
        
        query, 
        
        activated

        ).timeout(timeout);
    }


}
