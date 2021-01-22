import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:lisa_flutter/src/common/errors.dart';
import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:lisa_flutter/src/common/utils/base_url_provider.dart';
import 'package:lisa_flutter/src/devices/presentation/dashboard.dart';
import 'package:lisa_server_sdk/api/device_api.dart';
import 'package:lisa_server_sdk/api/plugin_api.dart';
import 'package:lisa_server_sdk/model/device.dart';
import 'package:lisa_server_sdk/model/device_settings.dart';
import 'package:lisa_server_sdk/model/plugin.dart';
import 'package:lisa_server_sdk/model/room.dart';
import 'package:mobx/mobx.dart';

part 'add_device_store.g.dart';

class AddDeviceStore = _AddDeviceStore with _$AddDeviceStore;

abstract class _AddDeviceStore with Store, BaseUrlProvider {
  final PluginApi _pluginApi;
  final DeviceApi _deviceApi;

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
  ObservableMap<String, dynamic> formData = ObservableMap.of({});

  @observable
  bool allDevicesSelected = false;

  /// Plugins list
  @observable
  ObservableList<Plugin> plugins;

  @observable
  String searchQuery;

  @observable
  ErrorResultException searchQueryError;

  /// Plugin device selection
  Plugin selectedPlugin;

  @observable
  DeviceSettings selectedDeviceTemplate;

  final Room room;

  /// Settings by list
  List<Map<String, dynamic>> availableDevices = [];

  /// Settings by json
  @observable
  Map<String, dynamic> deviceSettings = {};

  _AddDeviceStore({
    this.room,
    PluginApi pluginApi,
    DeviceApi deviceApi,
  })  : _pluginApi = pluginApi ?? BackendApiProvider().api.getPluginApi(),
        _deviceApi = deviceApi ?? BackendApiProvider().api.getDeviceApi() {
    _disposers = [reaction((_) => searchQuery, _search, delay: 500)];
  }

  bool _isDeviceNameValid() {
    //TODO also check against ^[A-zÀ-ÿ0-9_ -]+$
    return formData['name'] != null && formData['name'].isNotEmpty;
  }

  @action
  void formUpdate(String key, dynamic value, bool isFormValid) {
    formData[key] = value;
    canContinue = isFormValid && _isDeviceNameValid();
  }

  @action
  Future<void> _search(String query) async {
    try {
      searchQueryError = null;
      plugins = ObservableList.of((await _pluginApi.searchPlugins(query, activated: true)).data);
    } catch (ex, stack) {
      searchQueryError = handleError(ex, stack);
    }
  }

  @action
  Future<void> selectPluginDeviceTemplate(Plugin selectedPlugin, DeviceSettings selectedDevice) async {
    this.selectedPlugin = selectedPlugin;
    selectedDeviceTemplate = selectedDevice;

    if (selectedDeviceTemplate.pairing == 'settings') {
      currentCustomStep = ObservableMap.of({'step': 'settings'});
      _manageSettingsStep(selectedDeviceTemplate.settings.map((k, v) => MapEntry<String, Object>(k, toPrimitive(v))).toMap());
    } else if (selectedDeviceTemplate.pairing == 'list') {
      currentCustomStep = ObservableMap.of({'step': 'list'});
      _getDevicesList();
    } else if (selectedDeviceTemplate.pairing == 'image') {
      currentCustomStep = ObservableMap.of({'step': 'image'});
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

  void _manageSettingsStep(Map<String, dynamic> settings) {
    deviceSettings = settings;
  }

  void _manageImageStep(String image) {
    currentCustomStep['image'] = getPluginImageUrl(selectedPlugin.id, image);
  }

  Future<void> _getDevicesList() async {
    //TODO call getDevicesList on the plugin
    _manageListStep({});
  }

  Future<bool> _goToNextCustomStep() async {
    final data = (await _pluginApi.pairing(selectedDeviceTemplate.pluginName, selectedDeviceTemplate.driver, BuiltMap<String, JsonObject>(currentCustomData.map((key, value) => MapEntry(key, JsonObject(value)))))).data;
    currentCustomStep = ObservableMap.of(data.map((k, v) => MapEntry<String, Object>(k, toPrimitive(v))).toMap());
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
      _manageSettingsStep(data['settings'].map((k, v) => MapEntry(k, toPrimitive(v))).toMap());
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
    } else if (selectedDeviceTemplate.pairing == 'settings') {
      await _saveDevice();
      return true;
    }
    isLoading = false;
    return false;
  }

  Future<void> _saveDevice() {
    return _deviceApi.addDevice((DeviceBuilder()
      ..name= formData['name']
      ..roomId= room?.id
      ..template= formData['template'] ?? selectedDeviceTemplate.template
      ..type= formData['type'] ?? selectedDeviceTemplate.type
    ..driver= formData['driver'] ?? selectedDeviceTemplate.driver
    ..pluginName= selectedDeviceTemplate.pluginName
    ..data= MapBuilder<String, JsonObject>(formData)
    ).build());
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
