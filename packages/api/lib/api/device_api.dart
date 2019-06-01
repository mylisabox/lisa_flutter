import 'package:jaguar_retrofit/annotations/annotations.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_mimetype/jaguar_mimetype.dart';
import 'dart:async';

import 'package:lisa_server_sdk/model/update_device_name_request.dart';
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
    @PatchReq(path: "/api/v1/device/:deviceId", metadata: {"auth": [ {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header" }]})
    Future<void> saveDeviceName(
            @PathParam("deviceId") int deviceId
            ,
             @AsJson() UpdateDeviceNameRequest updateDeviceNameRequest
        ) {
        return super.saveDeviceName(
        deviceId

        ,
        updateDeviceNameRequest
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


}
