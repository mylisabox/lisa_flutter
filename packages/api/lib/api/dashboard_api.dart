import 'package:jaguar_retrofit/annotations/annotations.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_mimetype/jaguar_mimetype.dart';
import 'dart:async';

import 'package:lisa_server_sdk/model/dashboard.dart';

part 'dashboard_api.jretro.dart';

@GenApiClient()
class DashboardApi extends ApiClient with _$DashboardApiClient {
    final Route base;
    final Map<String, CodecRepo> converters;
    final Duration timeout;

    DashboardApi({this.base, this.converters, this.timeout = const Duration(minutes: 2)});

    /// 
    ///
    /// 
    @GetReq(path: "/api/v1/dashboard/room/:roomId", metadata: {"auth": [ {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header" }]})
    Future<Dashboard> getDashboard(
            @PathParam("roomId") int roomId
        ) {
        return super.getDashboard(
        roomId

        ).timeout(timeout);
    }

    /// 
    ///
    /// 
    @PostReq(path: "/api/v1/dashboard/room/:roomId", metadata: {"auth": [ {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header" }]})
    Future<void> saveDashboard(
            @PathParam("roomId") int roomId
            ,
             @AsJson() List<int> requestBody
        ) {
        return super.saveDashboard(
        roomId

        ,
        requestBody
        ).timeout(timeout);
    }


}
