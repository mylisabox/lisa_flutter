import 'dart:async';

import 'package:lisa_flutter/src/common/errors.dart';
import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:lisa_server_sdk/api/dashboard_api.dart';
import 'package:lisa_server_sdk/api/device_api.dart';
import 'package:lisa_server_sdk/api/favorite_api.dart';
import 'package:lisa_server_sdk/model/dashboard.dart';
import 'package:lisa_server_sdk/model/device.dart';
import 'package:lisa_server_sdk/model/update_device_info_request.dart';
import 'package:logging/logging.dart';
import 'package:mobx/mobx.dart';

part 'device_store.g.dart';

enum _DeviceLoadingMode { orphan, room }

class DeviceStore = _DeviceStore with _$DeviceStore;

abstract class _DeviceStore with Store {
  final _log = Logger('DeviceStore');
  _DeviceLoadingMode _mode;
  final DeviceApi _deviceApi;
  final FavoriteApi _favoriteApi;
  final DashboardApi _dashboardApi;

  _DeviceStore({
    DeviceApi deviceApi,
    FavoriteApi favoriteApi,
    DashboardApi dashboardApi,
  })  : _deviceApi = deviceApi ?? BackendApiProvider().api.getDeviceApi(),
        _favoriteApi = favoriteApi ?? BackendApiProvider().api.getFavoriteApi(),
        _dashboardApi = dashboardApi ?? BackendApiProvider().api.getDashboardApi();

  @observable
  ObservableList<Device> devices;

  @observable
  ErrorResultException error;

  Dashboard _dashboard;
  int _roomId;

  @action
  Future loadDevices({int roomId}) async {
    _mode = _DeviceLoadingMode.room;
    _roomId ??= roomId;

    try {
      _dashboard = await _dashboardApi.getDashboard(_roomId).catchError(handleCaughtError);
      this.devices = ObservableList.of(_dashboard.widgets);
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
      this.devices = ObservableList.of(await _deviceApi.getDevices('null').catchError(handleCaughtError));
      error = null;
    } on ErrorResultException catch (ex) {
      error = ex;
    }
  }

  @action
  Future<void> saveDevice(Device device, {String name, int roomId}) async {
    await _deviceApi.saveDeviceInfo(device.id, UpdateDeviceInfoRequest(name: name, roomId: roomId)).catchError(handleCaughtError);
    await refreshDevices();
  }

  @action
  Future<void> deleteDevice(int id) async {
    await _deviceApi.deleteDevice(id);
    devices.remove(devices.firstWhere((item) => item.id == id));
  }

  @action
  Future deviceChange(String key, dynamic value, {dynamic associatedData}) async {
    final device = associatedData as Device;
    if (device.pluginName == null) {
      await _deviceApi.updateGroup(_roomId, device.id, {'key': key, 'value': value});
    } else {
      await _deviceApi.updateDevice(device.id, device.pluginName, {'key': key, 'value': value});
    }
  }

  @action
  Future toggleFavorite(int deviceId, bool isFavorite) async {
    if (isFavorite ?? false) {
      await _favoriteApi.deleteFromFavorite(deviceId);
    } else {
      await _favoriteApi.addToFavorite(deviceId);
    }
    await loadDevices(roomId: _roomId);
  }
}
