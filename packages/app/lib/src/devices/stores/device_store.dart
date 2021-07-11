import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:lisa_flutter/src/common/errors.dart';
import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:lisa_server_sdk/lisa_server_sdk.dart';
import 'package:logging/logging.dart';
import 'package:mobx/mobx.dart';

part 'device_store.g.dart';

enum _DeviceLoadingMode { orphan, room }

class DeviceStore = _DeviceStore with _$DeviceStore;

abstract class _DeviceStore with Store {
  final _log = Logger('DeviceStore');
  _DeviceLoadingMode _mode = _DeviceLoadingMode.room;
  final DeviceApi _deviceApi;
  final FavoriteApi _favoriteApi;
  final DashboardApi _dashboardApi;

  _DeviceStore({
    DeviceApi?deviceApi,
    FavoriteApi? favoriteApi,
    DashboardApi? dashboardApi,
  })  : _deviceApi = deviceApi ?? BackendApiProvider().api.getDeviceApi(),
        _favoriteApi = favoriteApi ?? BackendApiProvider().api.getFavoriteApi(),
        _dashboardApi = dashboardApi ?? BackendApiProvider().api.getDashboardApi();

  @observable
  ObservableList<Device> devices = ObservableList();

  @observable
  ErrorResultException? error;

  Dashboard? _dashboard;
  int? _roomId;

  @action
  Future loadDevices({int? roomId}) async {
    _mode = _DeviceLoadingMode.room;
    _roomId ??= roomId;

    try {
      _dashboard = (await _dashboardApi.getDashboard(roomId: _roomId).catchError(handleCaughtError)).data!;
      this.devices = ObservableList.of(_dashboard!.widgets);
      error = null;
    } on ErrorResultException catch (ex) {
      error = ex;
    }
  }

  @action
  Future refreshDevices() async {
    if (_mode == _DeviceLoadingMode.orphan) {
      await loadOrphans();
    } else {
      await loadDevices();
    }
  }

  @action
  Future loadOrphans() async {
    _mode = _DeviceLoadingMode.orphan;

    try {
      _dashboard = null;
      this.devices = ObservableList.of((await _deviceApi.getDevices(roomId: null).catchError(handleCaughtError)).data!);
      error = null;
    } on ErrorResultException catch (ex) {
      error = ex;
    }
  }

  @action
  Future<void> saveDevice(Device device, {required String name, int? roomId}) async {
    await _deviceApi.saveDeviceInfo(deviceId: device.id, updateDeviceInfoRequest: (UpdateDeviceInfoRequestBuilder()..name= name.. roomId= roomId).build()).catchError(handleCaughtError);
    await refreshDevices();
  }

  @action
  Future<void> deleteDevice(int id) async {
    await _deviceApi.deleteDevice(deviceId: id);
    devices.remove(devices.firstWhere((item) => item.id == id));
  }

  @action
  Future deviceChange(String key, Object? value, {dynamic associatedData}) async {
    final device = associatedData as Device;
    if (device.pluginName == null) {
      await _deviceApi.updateGroup(roomId: _roomId!, groupId: device.id, requestBody: BuiltMap<String, JsonObject>({'key': JsonObject(key), 'value': value == null ? JsonObject('') : JsonObject(value)}));
    } else {
      await _deviceApi.updateDevice(deviceId: device.id, pluginName: device.pluginName!, requestBody: BuiltMap<String, JsonObject>({'key': JsonObject(key), 'value': value == null ? JsonObject('') : JsonObject(value)}));
    }
  }

  @action
  Future toggleFavorite(int deviceId, bool isFavorite) async {
    if (isFavorite) {
      await _favoriteApi.deleteFromFavorite(deviceId: deviceId);
    } else {
      await _favoriteApi.addToFavorite(deviceId: deviceId);
    }
    await loadDevices(roomId: _roomId);
  }
}
