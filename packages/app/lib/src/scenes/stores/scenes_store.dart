import 'dart:async';

import 'package:lisa_flutter/src/common/errors.dart';
import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:lisa_server_sdk/lisa_server_sdk.dart';
import 'package:logging/logging.dart';
import 'package:mobx/mobx.dart';

part 'scenes_store.g.dart';

class ScenesStore = _ScenesStore with _$ScenesStore;

abstract class _ScenesStore with Store {
  final _log = Logger('ScenesStore');
  final SceneApi _sceneApi;

  @observable
  ObservableList<Scene> scenes = ObservableList();

  @observable
  ErrorResultException? error;

  _ScenesStore({SceneApi? sceneApi}) : _sceneApi = sceneApi ?? BackendApiProvider().api.getSceneApi();

  @action
  Future<void> loadScenes() async {
    try {
      error = null;
      scenes = ObservableList.of((await _sceneApi.getScene().catchError(handleCaughtError)).data!);
    } on ErrorResultException catch (ex) {
      error = ex;
    }
  }

  @action
  Future<void> deleteScenes(int index) async {
    await _sceneApi.deleteScene(scene: scenes[index].name).catchError(handleCaughtError);
    scenes.removeAt(index);
  }
}
