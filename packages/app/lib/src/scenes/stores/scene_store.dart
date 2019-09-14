import 'dart:async';

import 'package:lisa_flutter/src/common/errors.dart';
import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:lisa_server_sdk/api/scene_api.dart';
import 'package:lisa_server_sdk/model/scene.dart';
import 'package:lisa_server_sdk/model/scene_data.dart';
import 'package:logging/logging.dart';
import 'package:mobx/mobx.dart';

part 'scene_store.g.dart';

class SceneStore = _SceneStore with _$SceneStore;

abstract class _SceneStore with Store {
  final _log = Logger('SceneStore');
  final SceneApi _sceneApi;
  Scene _scene;

  @observable
  String name = '';

  @observable
  ObservableList<String> sentences = ObservableList();

  @observable
  ObservableList<String> responses = ObservableList();

  @observable
  ObservableList<String> commands = ObservableList();

  @computed
  bool get canSave => commands.isNotEmpty && responses.isNotEmpty && sentences.isNotEmpty && name.isNotEmpty;

  @observable
  ErrorResultException error;

  _SceneStore({
    SceneApi sceneApi,
  }) : _sceneApi = sceneApi ?? BackendApiProvider().api.getSceneApi();

  @action
  void setScene(Scene scene) {
    _scene = scene;
    if (scene != null) {
      name = scene.displayName;
      commands = ObservableList.of(scene.data.commands);
      sentences = ObservableList.of(scene.data.sentences);
      responses = ObservableList.of(scene.data.responses);
    }
  }

  @action
  Future<void> saveScene() async {
    try {
      error = null;
      await _sceneApi
          .saveScene(
            Scene(
              name: _scene?.name,
              displayName: name,
              data: SceneData(
                commands: commands,
                responses: responses,
                sentences: sentences,
              ),
            ),
          )
          .catchError(handleCaughtError);
    } on ErrorResultException catch (ex) {
      error = ex;
    }
  }
}
