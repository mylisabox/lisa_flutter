// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_api.dart';

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$DeviceApiClient implements ApiClient {
  final String basePath = "";
  Future<void> deleteDevice(int deviceId) async {
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
        .path("/api/v1/device/:deviceId")
        .pathParams("deviceId", deviceId);
    await req.go(throwOnErr: true);
  }

  Future<void> saveDeviceName(
      int deviceId, UpdateDeviceNameRequest updateDeviceNameRequest) async {
    var req = base.patch
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
        .path("/api/v1/device/:deviceId")
        .pathParams("deviceId", deviceId)
        .json(jsonConverter.to(updateDeviceNameRequest));
    await req.go(throwOnErr: true);
  }

  Future<Device> updateDevice(
      int deviceId, String pluginName, Map<String, Object> requestBody) async {
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
        .path("/api/v1/plugins/:pluginName/:deviceId")
        .pathParams("deviceId", deviceId)
        .pathParams("pluginName", pluginName)
        .json(jsonConverter.to(requestBody));
    return req.go(throwOnErr: true).map(decodeOne);
  }
}
