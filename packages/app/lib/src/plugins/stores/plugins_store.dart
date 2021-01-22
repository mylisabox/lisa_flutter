import 'package:lisa_flutter/src/common/errors.dart';
import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:lisa_flutter/src/common/utils/base_url_provider.dart';
import 'package:lisa_server_sdk/api/plugin_api.dart';
import 'package:lisa_server_sdk/model/add_plugin_request.dart';
import 'package:lisa_server_sdk/model/store_plugin.dart';
import 'package:mobx/mobx.dart';

part 'plugins_store.g.dart';

class PluginsStore = _PluginsStore with _$PluginsStore;

abstract class _PluginsStore with Store, BaseUrlProvider {
  final BackendApiProvider _apiProvider;

  PluginApi get _api => _apiProvider.api.getPluginApi();

  _PluginsStore({BackendApiProvider api}) : _apiProvider = api ?? BackendApiProvider();

  @observable
  ObservableFuture<List<StorePlugin>> plugins;

  @observable
  ObservableList<StorePlugin> pluginsAction = ObservableList();

  @action
  Future<void> loadPlugins() {
    plugins = ObservableFuture(_api.getStorePlugins().catchError(handleCaughtError).then((value) => value.data.toList()));
    return plugins;
  }

  @action
  Future<void> install(StorePlugin plugin) async {
    pluginsAction.add(plugin);
    await _api.installPlugin((AddPluginRequestBuilder()..id = plugin.id).build()).catchError(handleCaughtError);
    await loadPlugins();
    pluginsAction.remove(plugin);
  }

  @action
  Future<void> uninstall(StorePlugin plugin) async {
    pluginsAction.add(plugin);
    await _api.uninstallPlugin(plugin.id).catchError(handleCaughtError);
    await loadPlugins();
    pluginsAction.remove(plugin);
  }
}
