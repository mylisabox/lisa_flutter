import 'package:jaguar_retrofit/annotations/annotations.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_mimetype/jaguar_mimetype.dart';
import 'dart:async';

import 'package:lisa_server_sdk/model/update_device_info_request.dart';
import 'package:lisa_server_sdk/model/device.dart';

part 'device_api.jretro.dart';

@GenApiClient()
class DeviceApi extends ApiClient with _$DeviceApiClient {
    final Route base;
    final Map<String, CodecRepo> converters;
    final Duration timeout;

    DeviceApi({this.base, this.converters, this.timeout = const Duration(minutes: 2)});

    /// 
    ///
    /// 
    @DeleteReq(path: "/api/v1/device/:deviceId", metadata: {"auth": [ {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header" }]})
    Future<void> deleteDevice(
            @PathParam("deviceId") int deviceId
        ) {
        return super.deleteDevice(
        deviceId

        ).timeout(timeout);
    }

    /// 
    ///
    /// 
    @GetReq(path: "/api/v1/device/", metadata: {"auth": [ {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header" }]})
    Future<List<Device>> getDevices(
        
            @QueryParam("roomId") String roomId
        ) {
        return super.getDevices(
        
        roomId

        ).timeout(timeout);
    }

    /// 
    ///
    /// 
    @PatchReq(path: "/api/v1/device/:deviceId", metadata: {"auth": [ {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header" }]})
    Future<void> saveDeviceInfo(
            @PathParam("deviceId") int deviceId
            ,
             @AsJson() UpdateDeviceInfoRequest updateDeviceInfoRequest
        ) {
        return super.saveDeviceInfo(
        deviceId

        ,
        updateDeviceInfoRequest
        ).timeout(timeout);
    }

    /// 
    ///
    /// 
    @PostReq(path: "/api/v1/plugins/:pluginName/:deviceId", metadata: {"auth": [ {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header" }]})
    Future<Device> updateDevice(
            @PathParam("deviceId") int deviceId, 
            @PathParam("pluginName") String pluginName
            ,
             @AsJson() Map<String, Object> requestBody
        ) {
        return super.updateDevice(
        deviceId, 
        pluginName

        ,
        requestBody
        ).timeout(timeout);
    }

    /// 
    ///
    /// 
    @PostReq(path: "/api/v1/devices/group/:roomId/:groupId", metadata: {"auth": [ {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header" }]})
    Future<void> updateGroup(
            @PathParam("roomId") int roomId, 
            @PathParam("groupId") int groupId
            ,
             @AsJson() Map<String, Object> requestBody
        ) {
        return super.updateGroup(
        roomId, 
        groupId

        ,
        requestBody
        ).timeout(timeout);
    }


}
