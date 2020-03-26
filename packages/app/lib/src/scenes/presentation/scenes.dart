import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_flutter/src/common/presentation/refresh_no_scroll_content.dart';
import 'package:lisa_flutter/src/common/utils/page_route_builders.dart';
import 'package:lisa_flutter/src/scenes/presentation/scene.dart';
import 'package:lisa_flutter/src/scenes/stores/scenes_store.dart';

class ScenesWidget extends HookWidget {
  static const route = '/scenes';

  @override
  Widget build(BuildContext context) {
    final store = useMemoized(() => ScenesStore());
    final refreshKey = useMemoized(() => GlobalKey<RefreshIndicatorState>());

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
                    store.error.cause.twoLiner(context),
                    style: TextStyle(color: Theme.of(context).errorColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }

            if (store.scenes == null) {
              return Center(child: CircularProgressIndicator());
            }

            if (store.scenes.length == 0) {
              return RefreshIndicatorContent(
                child: Center(child: Text(translations.emptyList)),
              );
            }

            return Scrollbar(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  sortAscending: false,
                  rows: <DataRow>[
                    for (var i = 0; i < store.scenes.length; i++)
                      DataRow(
                        cells: [
                          DataCell(
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () async {
                                    final needRefresh = await Navigator.of(context, rootNavigator: true).push(
                                          FromBottomPageRoute(
                                            builder: (context) => SceneWidget(scene: store.scenes[i]),
                                            settings: RouteSettings(name: SceneWidget.route),
                                          ),
                                        ) ??
                                        false;

                                    if (needRefresh) {
                                      refreshKey.currentState.show();
                                    }
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () async {
                                    await showLoadingDialog(context, (_) => Text(translations.deleting), () => store.deleteScenes(i), onError: (ex, stack) {
                                      showErrorDialog(context, ex, stack);
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          DataCell(Text(store.scenes[i].displayName)),
                          DataCell(Text(store.scenes[i].data.sentences.length.toString())),
                          DataCell(Text(store.scenes[i].data.responses.length.toString())),
                          DataCell(Text(store.scenes[i].data.commands.length.toString())),
                        ],
                      ),
                  ],
                  columns: <DataColumn>[
                    DataColumn(
                      label: Text(translations.actions, style: Theme.of(context).textTheme.title),
                    ),
                    DataColumn(
                      label: Text(translations.nameField, style: Theme.of(context).textTheme.title),
                    ),
                    DataColumn(
                      label: Text(translations.sceneCommandsTitle, style: Theme.of(context).textTheme.title),
                    ),
                    DataColumn(
                      label: Text(translations.sceneResponsesTitle, style: Theme.of(context).textTheme.title),
                    ),
                    DataColumn(
                      label: Text(translations.sceneCommandsTitle, style: Theme.of(context).textTheme.title),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final needRefresh = await Navigator.of(context, rootNavigator: true).push(
                FromBottomPageRoute(
                  builder: (context) => SceneWidget(),
                  settings: RouteSettings(name: SceneWidget.route),
                ),
              ) ??
              false;
          if (needRefresh) {
            refreshKey.currentState.show();
          }
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
