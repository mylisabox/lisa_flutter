import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:lisa_server_sdk/api.dart';
import 'package:mobx/mobx.dart';
import 'package:nymea_network_manager/nymea_network_manager.dart';

part 'setup_store.g.dart';

enum NetworkMode { idle, connectingBT, searchingNetworks, waitingNetworkInfo, savingNetwork, networkSaved }

class SetupStore = _SetupStore with _$SetupStore;

abstract class _SetupStore with Store {
  final BackendApiProvider _apiProvider;
  final NymeaNetworkManager _networkManager;

  _SetupStore({
    BackendApiProvider apiProvider,
    NymeaNetworkManager networkManager,
  })  : _apiProvider = apiProvider ?? BackendApiProvider(),
        _networkManager = networkManager ?? NymeaNetworkManager(advertisingName: 'mylisabox', enableLogs: true);

  LisaServerSdk get _api => _apiProvider.api;

  @observable
  NetworkMode currentMode = NetworkMode.idle;

  @observable
  ObservableFuture btConnecting;

  @observable
  ObservableFuture<List<WiFiNetwork>> searchingNetworks;

  @observable
  ObservableFuture savingNetwork;

  @action
  Future<void> searchAndConnectToBTDevice() {
    currentMode = NetworkMode.connectingBT;
    btConnecting = ObservableFuture(_networkManager.connect());
    return btConnecting.then((value) => searchRemoteNetworks());
  }

  @action
  Future<void> searchRemoteNetworks() async {
    currentMode = NetworkMode.searchingNetworks;
    searchingNetworks = ObservableFuture(_networkManager.getNetworks().then((value) {
      currentMode = NetworkMode.waitingNetworkInfo;
      return value;
    }));
  }

  @action
  Future<void> connectToNetwork(String ssid, String password) async {
    currentMode = NetworkMode.savingNetwork;
    savingNetwork = ObservableFuture(_networkManager.connectNetwork(ssid, password).then((value) async {
      currentMode = NetworkMode.networkSaved;
    }));
  }

  void dispose() {
    _networkManager.disconnect();
  }
}
