import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:lisa_flutter/src/common/errors.dart';
import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:lisa_server_sdk/lisa_server_sdk.dart';
import 'package:logging/logging.dart';
import 'package:mobx/mobx.dart';

part 'scene_store.g.dart';

class SceneStore = _SceneStore with _$SceneStore;

enum SceneEntryType { sentence, response, command }

abstract class _SceneStore with Store {
  final _log = Logger('SceneStore');
  final SceneApi _sceneApi;
  Scene? _scene;

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
  ErrorResultException? error;

  _SceneStore({
    SceneApi? sceneApi,
  }) : _sceneApi = sceneApi ?? BackendApiProvider().api.getSceneApi();

  @action
  void addSceneEntry(SceneEntryType type, String item) {
    switch (type) {
      case SceneEntryType.sentence:
        _addItem(sentences, item);
        break;
      case SceneEntryType.response:
        _addItem(responses, item);
        break;
      case SceneEntryType.command:
        _addItem(commands, item);
        break;
    }
  }

  @action
  void updateName(String name) {
    this.name = name;
  }

  @action
  void removeSceneEntry(SceneEntryType type, int index) {
    switch (type) {
      case SceneEntryType.sentence:
        _removeItem(sentences, index);
        break;
      case SceneEntryType.response:
        _removeItem(responses, index);
        break;
      case SceneEntryType.command:
        _removeItem(commands, index);
        break;
    }
  }

  void _removeItem(ObservableList list, int index) {
    list.removeAt(index);
  }

  void _addItem(ObservableList list, String item) {
    list.add(item);
  }

  @action
  void setScene(Scene? scene) {
    _scene = scene;
    if (scene != null) {
      name = scene.displayName;
      commands = ObservableList.of(scene.data.commands.toList());
      sentences = ObservableList.of(scene.data.sentences.toList());
      responses = ObservableList.of(scene.data.responses.toList());
    }
  }

  @action
  Future<void> saveScene() async {
    try {
      error = null;
      await _sceneApi
          .saveScene(
            scene: (SceneBuilder()
                  ..name = _scene?.name
                  ..displayName = name
                  ..data = (SceneDataBuilder()
                    ..commands = ListBuilder(commands)
                    ..responses = ListBuilder(responses)
                    ..sentences = ListBuilder(sentences)))
                .build(),
          )
          .catchError(handleCaughtError);
    } on ErrorResultException catch (ex) {
      error = ex;
    }
  }
}
