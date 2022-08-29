import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_flutter/src/common/presentation/loading.dart';
import 'package:lisa_flutter/src/common/presentation/refresh_no_scroll_content.dart';
import 'package:lisa_flutter/src/common/utils/extensions.dart';
import 'package:lisa_flutter/src/common/utils/page_route_builders.dart';
import 'package:lisa_flutter/src/scenes/presentation/scene.dart';
import 'package:lisa_flutter/src/scenes/stores/scenes_store.dart';
import 'package:lisa_server_sdk/lisa_server_sdk.dart';

class ScenesScreen extends StatelessWidget {
  static const route = '/scenes';

  const ScenesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.menuScenes),
      ),
      body: const ScenesWidget(),
    );
  }
}

class ScenesWidget extends HookWidget {
  const ScenesWidget({Key? key}) : super(key: key);

  void editScene(BuildContext context, Scene? scene, GlobalKey<RefreshIndicatorState> refreshKey) async {
    final needRefresh = await Navigator.of(context, rootNavigator: true).push(
          FromBottomPageRoute(
            builder: (context) => SceneWidget(scene: scene),
            settings: const RouteSettings(name: SceneWidget.route),
          ),
        ) ??
        false;

    if (needRefresh) {
      refreshKey.currentState!.show();
    }
  }

  @override
  Widget build(BuildContext context) {
    final store = useMemoized(() => ScenesStore());
    final refreshKey = useMemoized(() => GlobalKey<RefreshIndicatorState>());
    final controller = useScrollController();

    useEffect(() {
      store.loadScenes();
      return null;
    }, const []);

    final translations = CommonLocalizations.of(context);
    return Scaffold(
      primary: false,
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: () {
          return store.loadScenes();
        },
        child: Observer(
          builder: (context) {
            if (store.error != null) {
              return RefreshIndicatorContent(
                child: Center(
                  child: Text(
                    store.error!.cause.twoLiner(context),
                    style: TextStyle(color: Theme.of(context).errorColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }

            if (store.scenes == null) {
              return const Loading();
            }

            if (store.scenes!.isEmpty) {
              return RefreshIndicatorContent(
                child: Center(child: Text(translations.emptyList)),
              );
            }

            return Scrollbar(
              controller: controller,
              child: SingleChildScrollView(
                controller: controller,
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    showCheckboxColumn: false,
                    sortAscending: false,
                    rows: <DataRow>[
                      for (var i = 0; i < store.scenes!.length; i++)
                        DataRow(
                          onSelectChanged: (selected) {
                            if (selected!) {
                              editScene(context, store.scenes![i], refreshKey);
                            }
                          },
                          cells: [
                            DataCell(
                              Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () async {
                                      editScene(context, store.scenes![i], refreshKey);
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () async {
                                      final result = await showConfirm(context, translations.deleteItem(store.scenes![i].displayName), translations.deleteConfirm);
                                      if (result) {
                                        await showLoadingDialog(context, (_) => Text(translations.deleting), () => store.deleteScenes(i), onError: (ex, stack) {
                                          showErrorDialog(context, ex, stack);
                                        });
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            DataCell(Text(store.scenes![i].displayName)),
                            DataCell(Text(store.scenes![i].data.sentences.length.toString())),
                            DataCell(Text(store.scenes![i].data.responses.length.toString())),
                            DataCell(Text(store.scenes![i].data.commands.length.toString())),
                          ],
                        ),
                    ],
                    columns: <DataColumn>[
                      DataColumn(
                        label: Text(translations.actions, style: Theme.of(context).textTheme.headline6),
                      ),
                      DataColumn(
                        label: Text(translations.nameField, style: Theme.of(context).textTheme.headline6),
                      ),
                      DataColumn(
                        label: Text(translations.sceneCommandsTitle, style: Theme.of(context).textTheme.headline6),
                      ),
                      DataColumn(
                        label: Text(translations.sceneResponsesTitle, style: Theme.of(context).textTheme.headline6),
                      ),
                      DataColumn(
                        label: Text(translations.sceneCommandsTitle, style: Theme.of(context).textTheme.headline6),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          editScene(context, null, refreshKey);
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
