import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:lisa_server_sdk/api/dashboard_api.dart';
import 'package:lisa_server_sdk/api/device_api.dart';
import 'package:lisa_server_sdk/api/favorite_api.dart';
import 'package:lisa_server_sdk/model/dashboard.dart';
import 'package:lisa_server_sdk/model/device.dart';
import 'package:mobx/mobx.dart';

part 'device_bloc.g.dart';

class DeviceBloc = _DeviceBloc with _$DeviceBloc;

abstract class _DeviceBloc with Store {
  final DeviceApi _deviceApi;
  final FavoriteApi _favoriteApi;
  final DashboardApi _dashboardApi;

  _DeviceBloc({
    DeviceApi deviceApi,
    FavoriteApi favoriteApi,
    DashboardApi dashboardApi,
  })  : _deviceApi = deviceApi ?? BackendApiProvider().api.getDeviceApi(),
        _favoriteApi = favoriteApi ?? BackendApiProvider().api.getFavoriteApi(),
        _dashboardApi = dashboardApi ?? BackendApiProvider().api.getDashboardApi();

  @observable
  List<Device> devices = [];

  @observable
  bool isLoading = false;

  Dashboard _dashboard;
  int _roomId;

  @action
  Future loadDevices({int roomId, List<Device> devices, bool isManual = false}) async {
    isLoading = true && !isManual;
    _roomId = roomId;
    if (devices != null) {
      this.devices = devices;
      isLoading = false;
      return;
    }

    _dashboard = await _dashboardApi.getDashboard(roomId);
    this.devices = _dashboard.widgets;
    isLoading = false;
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
