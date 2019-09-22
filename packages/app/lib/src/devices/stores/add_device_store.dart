import 'package:flutter/foundation.dart';
import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:lisa_flutter/src/common/utils/base_url_provider.dart';
import 'package:lisa_server_sdk/api/plugin_api.dart';
import 'package:lisa_server_sdk/model/device_settings.dart';
import 'package:lisa_server_sdk/model/plugin.dart';
import 'package:lisa_server_sdk/model/room.dart';
import 'package:mobx/mobx.dart';

part 'add_device_store.g.dart';

class AddDeviceStore = _AddDeviceStore with _$AddDeviceStore;

abstract class _AddDeviceStore with Store, BaseUrlProvider {
  final PluginApi _pluginApi;

  /// Global management
  List<Map<String, dynamic>> stepHistory = [];

  List<ReactionDisposer> _disposers;

  @observable
  bool canContinue = false;

  @observable
  bool isLoading = false;

  @observable
  ObservableMap<String, dynamic> currentCustomStep = ObservableMap.of({});

  @observable
  ObservableMap<String, dynamic> currentCustomData = ObservableMap.of({});

  @observable
  bool allDevicesSelected = false;

  /// Plugins list
  @observable
  ObservableList<Plugin> plugins;

  @observable
  String searchQuery;

  /// Plugin device selection
  Plugin selectedPlugin;

  @observable
  DeviceSettings selectedDeviceTemplate;

  final Room room;

  /// Settings by list
  List<Map<String, dynamic>> availableDevices = [];

  _AddDeviceStore({this.room, PluginApi pluginApi}) : _pluginApi = pluginApi ?? BackendApiProvider().api.getPluginApi() {
    _disposers = [reaction((_) => searchQuery, _search, delay: 500)];
  }

  @action
  Future<void> _search(String query) async {
    plugins = ObservableList.of(await _pluginApi.searchPlugins(query, true));
  }

  @action
  Future<void> selectPluginDeviceTemplate(Plugin selectedPlugin, DeviceSettings selectedDevice) async {
    this.selectedPlugin = selectedPlugin;
    selectedDeviceTemplate = selectedDevice;

    if (selectedDeviceTemplate.pairing == 'settings') {
      _manageSettingsStep(selectedDeviceTemplate.settings);
    } else if (selectedDeviceTemplate.pairing == 'list') {
      _getDevicesList();
    } else if (selectedDeviceTemplate.pairing == 'image') {
      _manageImageStep('TODO');
    } else if (selectedDeviceTemplate.pairing == 'custom') {
      await _goToNextCustomStep();
    }
  }

  @action
  void selectDevice(Map<String, dynamic> device, {bool selected = true}) {
    final singleChoice = currentCustomStep['singleChoice'] ?? false;
    if (singleChoice) {
      if (selected) {
        currentCustomData[currentCustomStep['step']] = device;
      }
    } else {
      if (currentCustomData[currentCustomStep['step']] == null) {
        currentCustomData[currentCustomStep['step']] = [];
      }
      if (selected) {
        currentCustomData[currentCustomStep['step']].add(device);
      } else {
        currentCustomData[currentCustomStep['step']].remove(device);
      }
    }
    canContinue = true;
  }

  @action
  void selectAllDevices(bool selected) {
    currentCustomData[currentCustomStep['step']] = selected ? List.from(availableDevices) : [];
    canContinue = selected;
    allDevicesSelected = selected;
  }

  void _manageSettingsStep(settings) {}

  void _manageImageStep(String image) {
    currentCustomStep['image'] = getPluginImageUrl(selectedPlugin.id, image);
  }

  Future<void> _getDevicesList() async {
    //TODO call getDevicesList on the plugin
    _manageListStep({});
  }

  Future<bool> _goToNextCustomStep() async {
    final data = await _pluginApi.pairing(selectedDeviceTemplate.pluginName, selectedDeviceTemplate.driver, currentCustomData);
    currentCustomStep = ObservableMap.of(data.cast<String, dynamic>());
    return _manageCurrentStep();
  }

  @action
  bool back() {
    canContinue = false;

    if (selectedPlugin == null) {
      return true;
    } else if (stepHistory.isEmpty) {
      _resetFlow();
    } else {
      final previous = stepHistory.removeLast();
      currentCustomData[currentCustomStep['step']] = null;
      currentCustomStep = previous;
      _manageCurrentStep();
      canContinue = true;
    }

    return false;
  }

  void _resetFlow() {
    currentCustomStep = ObservableMap.of({});
    selectedDeviceTemplate = null;
    selectedPlugin = null;
    currentCustomData = ObservableMap.of({});
    stepHistory = [];
  }

  void _manageListStep(Map<String, dynamic> stepList) {
    allDevicesSelected = false;
    availableDevices = ObservableList.of(
      stepList['devices']
              .map((device) {
                device['roomId'] = room?.id;
                return device;
              })
              .toList()
              .cast<Map<String, dynamic>>() ??
          [],
    );
  }

  bool _manageCurrentStep() {
    final data = currentCustomStep;
    if (data['step'].contains('list')) {
      _manageListStep(data);
    } else if (data['step'].contains('settings')) {
      _manageSettingsStep(data['settings']);
    } else if (data['step'].contains('image')) {
      _manageImageStep(data['image']);
    } else if (data['step'].contains('done')) {
      return true;
    }
    return false;
  }

  @action
  Future<bool> next() async {
    isLoading = true;
    stepHistory.add(currentCustomStep);
    if (selectedDeviceTemplate.pairing == 'custom') {
      return await _goToNextCustomStep().then((finished) {
        isLoading = false;
        return finished;
      });
    }
    isLoading = false;
    return false;
  }

  @override
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
