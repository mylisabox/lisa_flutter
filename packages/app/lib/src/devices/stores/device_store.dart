import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:lisa_flutter/src/common/utils/extensions.dart';
import 'package:lisa_server_sdk/lisa_server_sdk.dart';
import 'package:logging/logging.dart';
import 'package:mobx/mobx.dart';

part 'device_store.g.dart';

class DeviceStore = _DeviceStore with _$DeviceStore;

abstract class _DeviceStore with Store {
  final _log = Logger('DeviceStore');
  final DeviceApi _deviceApi;

  @observable
  ObservableFuture<List<Device>>? loadDeviceListRequest;

  @observable
  List<Device> deviceList = [];

  @observable
  ObservableFuture<Device>? loadDeviceRequest;

  @observable
  Device? device;

  _DeviceStore({
    DeviceApi? deviceApi,
  }) : _deviceApi = deviceApi ?? BackendApiProvider().api.getDeviceApi();

  @action
  Future<void> loadDevice(Device deviceToLoad) async {
    loadDeviceRequest = ObservableFuture<Device>(_loadDeviceData(deviceToLoad));
  }

  @action
  Future<void> loadDevices(List<Device> devicesToLoad) async {
    loadDeviceListRequest = ObservableFuture(_loadDevicesData(devicesToLoad));
  }

  Future<List<Device>> _loadDevicesData(List<Device> devicesToLoad) async {
    final response = await _deviceApi.getDevicesData(deviceIds: BuiltList.from(devicesToLoad.map((e) => e.id)));
    return deviceList = response.data!.toList();
  }

  Future<Device> _loadDeviceData(Device deviceToLoad) async {
    if ((deviceToLoad.grouped ?? false)) {
      final devices = <Device>[];
      for (var device in deviceToLoad.children!.toList()) {
        final response = await _deviceApi.getDeviceData(deviceId: device.id);
        devices.add(response.data!);
      }
      device = DeviceExtension.createGroup(devices, deviceToLoad.name, deviceToLoad.sortOrder);
    } else {
      final response = await _deviceApi.getDeviceData(deviceId: deviceToLoad.id);
      device = response.data!;
    }
    return device!;
  }

  @action
  Future<void> saveDevice(Device device, {required String name, int? roomId}) async {
    await _deviceApi
        .saveDeviceInfo(
            deviceId: device.id,
            updateDeviceInfoRequest: (UpdateDeviceInfoRequestBuilder()
                  ..name = name
                  ..roomId = roomId)
                .build());
    await loadDevice(device);
  }

  @action
  Future<void> deleteDevice(int id) async {
    await _deviceApi.deleteDevice(deviceId: id);
  }

  @action
  Future deviceChange(String key, Object? value, {Device? deviceToChange}) async {
    final device = deviceToChange ?? this.device!;
    if (device.grouped ?? false) {
      await _deviceApi.updateGroup(
          roomId: device.roomId,
          type: device.type.name,
          requestBody: BuiltMap<String, JsonObject>({'key': JsonObject(key), 'value': value == null ? JsonObject('') : JsonObject(value)}));
    } else {
      await _deviceApi.updateDevice(
          deviceId: device.id,
          requestBody: BuiltMap<String, JsonObject>({'key': JsonObject(key), 'value': value == null ? JsonObject('') : JsonObject(value)}));
    }
    await loadDevice(device);
  }
}
