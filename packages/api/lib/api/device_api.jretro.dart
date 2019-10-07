// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_api.dart';

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$DeviceApiClient implements ApiClient {
  final String basePath = "";
  Future<void> addDevice(Device device) async {
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
        .path("/api/v1/device/")
        .json(jsonConverter.to(device));
    await req.go(throwOnErr: true);
  }

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

  Future<List<Device>> getDevices(String roomId) async {
    var req = base.get
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
        .path("/api/v1/device/")
        .query("roomId", roomId);
    return req.go(throwOnErr: true).map(decodeList);
  }

  Future<void> saveDeviceInfo(
      int deviceId, UpdateDeviceInfoRequest updateDeviceInfoRequest) async {
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
        .json(jsonConverter.to(updateDeviceInfoRequest));
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

  Future<void> updateGroup(
      int roomId, int groupId, Map<String, Object> requestBody) async {
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
        .path("/api/v1/devices/group/:roomId/:groupId")
        .pathParams("roomId", roomId)
        .pathParams("groupId", groupId)
        .json(jsonConverter.to(requestBody));
    await req.go(throwOnErr: true);
  }
}
