import 'dart:async';

import 'package:lisa_flutter/src/common/errors.dart';
import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:lisa_server_sdk/api/dashboard_api.dart';
import 'package:lisa_server_sdk/api/device_api.dart';
import 'package:lisa_server_sdk/api/favorite_api.dart';
import 'package:lisa_server_sdk/model/dashboard.dart';
import 'package:lisa_server_sdk/model/device.dart';
import 'package:logging/logging.dart';
import 'package:mobx/mobx.dart';

part 'device_store.g.dart';

class DeviceStore = _DeviceStore with _$DeviceStore;

abstract class _DeviceStore with Store {
  final _log = Logger('DeviceStore');
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
  List<Device> devices;

  @observable
  ErrorResultException error;

  Dashboard _dashboard;
  int _roomId;

  @action
  Future loadDevices({int roomId, List<Device> devices}) async {
    _roomId = roomId;
    if (devices != null) {
      this.devices = devices;
      return;
    }

    try {
      _dashboard = await _dashboardApi.getDashboard(roomId).catchError(handleCaughtError);
      this.devices = _dashboard.widgets;
    } on ErrorResultException catch (ex) {
      error = ex;
    }
  }

  @action
  Future deviceChange(String key, dynamic value, {associatedData}) async {
    final device = associatedData as Device;
    await _deviceApi.updateDevice(device.id, device.pluginName, {'key': key, 'value': value});
  }

  @action
  Future toggleFavorite(int deviceId, bool isFavorite) async {
    if (isFavorite) {
      await _favoriteApi.deleteFromFavorite(deviceId);
    } else {
      await _favoriteApi.addToFavorite(deviceId);
    }
    await loadDevices(roomId: _roomId);
  }
}
