import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_flutter/src/common/utils/hooks.dart';
import 'package:lisa_flutter/src/scenes/stores/scene_store.dart';
import 'package:lisa_server_sdk/model/scene.dart';

enum _SceneEntryType { sentence, response, command }

class SceneWidget extends HookWidget {
  static const route = '/scenes/scene';
  final Scene scene;

  const SceneWidget({Key key, this.scene}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = useDisposable(() => SceneStore(), [scene]);
    final sentencesExpanded = useState(true);
    final responsesExpanded = useState(true);
    final commandsExpanded = useState(true);
    final nameController = useTextEditingController(text: scene?.displayName);
    final translations = CommonLocalizations.of(context);

    useEffect(() {
      store.setScene(scene);
      return null;
    }, [scene]);

    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        title: Text(scene?.displayName ?? translations.addScene),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(kNormalPadding),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: translations.nameField),
                      controller: nameController,
                      onChanged: (text) {
                        store.setName(text);
                      },
                      onSubmitted: (text) {
                        store.setName(text);
                      },
                    ),
                    ExpansionPanelList(
                      expansionCallback: (index, isExpanded) {
                        if (index == 0) {
                          sentencesExpanded.value = !isExpanded;
                        } else if (index == 1) {
                          responsesExpanded.value = !isExpanded;
                        } else {
                          commandsExpanded.value = !isExpanded;
                        }
                      },
                      children: [
                        _Section(
                          title: translations.sceneCommandsTitle,
                          contentBuilder: () => store.sentences,
                          isExpanded: sentencesExpanded.value,
                          onAddClicked: () {
                            askForEntry(context, store, _SceneEntryType.sentence);
                          },
                          onDeleteClicked: (index) {
                            askForRemoval(context, store, _SceneEntryType.sentence, index);
                          },
                        ),
                        _Section(
                          title: translations.sceneResponsesTitle,
                          contentBuilder: () => store.responses,
                          isExpanded: responsesExpanded.value,
                          onAddClicked: () {
                            askForEntry(context, store, _SceneEntryType.response);
                          },
                          onDeleteClicked: (index) {
                            askForRemoval(context, store, _SceneEntryType.response, index);
                          },
                        ),
                        _Section(
                          title: translations.sceneActionsTitle,
                          contentBuilder: () => store.commands,
                          isExpanded: commandsExpanded.value,
                          onDeleteClicked: (index) {
                            askForRemoval(context, store, _SceneEntryType.command, index);
                          },
                          onAddClicked: () {
                            askForEntry(context, store, _SceneEntryType.command);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Divider(height: 1),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
                child: Text(translations.cancel.toUpperCase()),
              ),
              Observer(
                builder: (context) => FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  onPressed: store.canSave
                      ? () async {
                          final success = await showLoadingDialog(context, (_) => Text(translations.saving), () => store.saveScene(), onError: (ex, stack) {
                            showErrorDialog(context, ex, stack);
                          });
                          if (success) {
                            Navigator.of(context, rootNavigator: true).pop(true);
                          }
                        }
                      : null,
                  child: Text(translations.save.toUpperCase()),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void askForEntry(BuildContext context, SceneStore store, _SceneEntryType type) async {
    final translations = CommonLocalizations.of(context);
    String title;
    switch (type) {
      case _SceneEntryType.command:
        title = translations.sceneAddCommand;
        break;
      case _SceneEntryType.sentence:
        title = translations.sceneAddSentence;
        break;
      case _SceneEntryType.response:
        title = translations.sceneAddResponse;
        break;
    }
    final text = await showPrompt(context, title);

    if (text != null || text.isNotEmpty) {
      switch (type) {
        case _SceneEntryType.command:
          store.commands.add(text);
          break;
        case _SceneEntryType.sentence:
          store.sentences.add(text);
          break;
        case _SceneEntryType.response:
          store.responses.add(text);
          break;
      }
    }
  }

  void askForRemoval(BuildContext context, SceneStore store, _SceneEntryType type, int index) {
    switch (type) {
      case _SceneEntryType.command:
        store.commands.removeAt(index);
        break;
      case _SceneEntryType.sentence:
        store.sentences.removeAt(index);
        break;
      case _SceneEntryType.response:
        store.responses.removeAt(index);
        break;
    }
  }
}

class _Section extends ExpansionPanel {
  final String title;
  final List<String> Function() contentBuilder;
  final VoidCallback onAddClicked;
  final Function(int index) onDeleteClicked;
  final bool isExpanded;

  _Section({this.title, this.contentBuilder, this.onAddClicked, this.isExpanded, this.onDeleteClicked})
      : super(
          isExpanded: isExpanded,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Padding(
              padding: const EdgeInsets.all(kNormalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  IconButton(icon: Icon(Icons.add), onPressed: onAddClicked),
                ],
              ),
            );
          },
          body: Observer(
            builder: (context) {
              final transaction = CommonLocalizations.of(context);
              final data = contentBuilder();
              if (data.length == 0) {
                return Column(
                  children: <Widget>[
                    Divider(height: 1),
                    Padding(
                      padding: const EdgeInsets.all(kMediumPadding),
                      child: Center(child: Text(transaction.emptyList)),
                    ),
                  ],
                );
              }
              return Column(children: [
                Divider(height: 1),
                for (var i = 0; i < data.length; i++)
                  Padding(
                    padding: const EdgeInsets.all(kMediumPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text(data[i]), IconButton(icon: Icon(Icons.delete), onPressed: () => onDeleteClicked(i))],
                    ),
                  ),
              ]);
            },
          ),
        );
}
