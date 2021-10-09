import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_flutter/src/scenes/stores/scene_store.dart';
import 'package:lisa_server_sdk/lisa_server_sdk.dart';

class SceneWidget extends HookWidget {
  static const route = '/scenes/scene';
  final Scene? scene;

  const SceneWidget({Key? key, this.scene}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = useMemoized(() => SceneStore(), [scene]);
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
        leading: const CloseButton(),
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
                      autofocus: true,
                      onChanged: (text) {
                        store.updateName(text);
                      },
                      onSubmitted: (text) {
                        store.updateName(text);
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
                            askForEntry(context, store, SceneEntryType.sentence);
                          },
                          onDeleteClicked: (index) {
                            askForRemoval(context, store, SceneEntryType.sentence, index);
                          },
                        ),
                        _Section(
                          title: translations.sceneResponsesTitle,
                          contentBuilder: () => store.responses,
                          isExpanded: responsesExpanded.value,
                          onAddClicked: () {
                            askForEntry(context, store, SceneEntryType.response);
                          },
                          onDeleteClicked: (index) {
                            askForRemoval(context, store, SceneEntryType.response, index);
                          },
                        ),
                        _Section(
                          title: translations.sceneActionsTitle,
                          contentBuilder: () => store.commands,
                          isExpanded: commandsExpanded.value,
                          onDeleteClicked: (index) {
                            askForRemoval(context, store, SceneEntryType.command, index);
                          },
                          onAddClicked: () {
                            askForEntry(context, store, SceneEntryType.command);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(height: 1),
          ButtonBar(
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                ),
                child: Text(translations.cancel.toUpperCase()),
              ),
              Observer(
                builder: (context) => TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return  Colors.grey[300];
                      }
                      return Theme.of(context).primaryColor;
                    }),
                  ),
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

  void askForEntry(BuildContext context, SceneStore store, SceneEntryType type) async {
    final translations = CommonLocalizations.of(context);
    String title;
    switch (type) {
      case SceneEntryType.command:
        title = translations.sceneAddCommand;
        break;
      case SceneEntryType.sentence:
        title = translations.sceneAddSentence;
        break;
      case SceneEntryType.response:
        title = translations.sceneAddResponse;
        break;
    }
    final text = await showPrompt(context, title);

    if (text != null && text.trim().isNotEmpty) {
      store.addSceneEntry(type, text);
    }
  }

  void askForRemoval(BuildContext context, SceneStore store, SceneEntryType type, int index) {
    store.removeSceneEntry(type, index);
  }
}

class _Section extends ExpansionPanel {
  final String title;
  final List<String> Function() contentBuilder;
  final VoidCallback onAddClicked;
  final Function(int index) onDeleteClicked;

  _Section({required this.title, required this.contentBuilder, required this.onAddClicked, required bool isExpanded, required this.onDeleteClicked})
      : super(
          isExpanded: isExpanded,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Padding(
              padding: const EdgeInsets.all(kNormalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  IconButton(icon: const Icon(Icons.add, color: Colors.white), onPressed: onAddClicked),
                ],
              ),
            );
          },
          body: Observer(
            builder: (context) {
              final transaction = CommonLocalizations.of(context);
              final data = contentBuilder();
              if (data.isEmpty) {
                return Column(
                  children: <Widget>[
                    const Divider(height: 1),
                    Padding(
                      padding: const EdgeInsets.all(kMediumPadding),
                      child: Center(child: Text(transaction.emptyList)),
                    ),
                  ],
                );
              }
              return Column(children: [
                const Divider(height: 1),
                for (var i = 0; i < data.length; i++)
                  Padding(
                    padding: const EdgeInsets.all(kMediumPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text(data[i]), IconButton(icon: const Icon(Icons.delete), onPressed: () => onDeleteClicked(i))],
                    ),
                  ),
              ]);
            },
          ),
        );
}
