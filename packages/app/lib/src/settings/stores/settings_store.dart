import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:mobx/mobx.dart';
import 'package:path/path.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStore with _$SettingsStore;

abstract class _SettingsStore with Store {
  final BackendApiProvider _apiProvider;

  _SettingsStore({BackendApiProvider apiProvider})
      : _apiProvider = apiProvider ?? BackendApiProvider();

  @action
  void init() {

  }

  Future<void> saveVoiceCommandsConfig(List<int> configFile, String fileName) async {
    final setupApi = _apiProvider.api.getSetupApi();
    await setupApi.setupVoiceCommands(MultipartFile(configFile, filename: basename(fileName)));
  }
}
