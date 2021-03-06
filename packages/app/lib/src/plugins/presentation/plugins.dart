import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_flutter/src/plugins/stores/plugins_store.dart';
import 'package:mobx/mobx.dart';

class PluginsStoreWidget extends HookWidget {
  static const route = '/pluginsStore';

  @override
  Widget build(BuildContext context) {
    final translations = CommonLocalizations.of(context);
    final store = useMemoized(() => PluginsStore());

    useEffect(() {
      store.loadPlugins();
      return null;
    }, const []);

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Observer(
        builder: (context) {
          if (store.plugins.status == FutureStatus.pending) {
            return Center(child: CircularProgressIndicator());
          }
          if (store.plugins.status == FutureStatus.rejected) {
            return Center(child: Text(store.plugins.error.toString(), style: TextStyle(color: Theme.of(context).errorColor)));
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              final plugin = store.plugins.value![index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        plugin.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            store.baseUrl + '/assets/plugins/${plugin.id}.png',
                            errorBuilder: (_, __, ___) {
                              return Image.asset('assets/images/logo.png');
                            },
                            loadingBuilder: (_, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(child: CircularProgressIndicator());
                            },
                          ),
                        ),
                      ),
                      Text(
                        plugin.description,
                        textAlign: TextAlign.left,
                        maxLines: 3,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      ButtonBar(
                        children: [
                          Observer(
                            builder: (context) => TextButton(
                              onPressed: store.pluginsAction.contains(plugin)
                                  ? null
                                  : () async {
                                      final confirmed = await showConfirm(
                                        context,
                                        (plugin.installed ? translations.uninstallPlugin : translations.installPlugin) + plugin.name,
                                        plugin.installed ? translations.uninstallPluginDesc(plugin.name) : translations.installPluginDesc(plugin.name),
                                      );

                                      if (confirmed) {
                                        plugin.installed ? store.uninstall(plugin) : store.install(plugin);
                                      }
                                    },
                              style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(plugin.installed ? Theme.of(context).errorColor : Theme.of(context).primaryColor),
                              ),
                              child: Text(
                                plugin.installed ? translations.uninstallPlugin : translations.installPlugin,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            padding: EdgeInsets.all(16),
            itemCount: store.plugins.value!.length,
          );
        },
      ),
    );
  }
}
