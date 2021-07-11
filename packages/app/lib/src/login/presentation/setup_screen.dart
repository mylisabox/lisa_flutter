import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_flutter/src/common/utils/hooks.dart';
import 'package:lisa_flutter/src/login/stores/setup_store.dart';
import 'package:mobx/mobx.dart';
import 'package:nymea_network_manager/nymea_network_manager.dart';
import 'package:provider/provider.dart';

class SetupScreen extends HookWidget {
  static const route = 'setup';

  @override
  Widget build(BuildContext context) {
    final localization = CommonLocalizations.of(context);
    final SetupStore store = useDisposable(() => SetupStore());
    final PageController controller = useDisposable(() => PageController());

    return Provider.value(
      value: store,
      child: Scaffold(
        appBar: AppBar(
          title: Text(localization.setupTitle),
        ),
        body: Column(
          children: [
            _SetupStatusBar(),
            Expanded(
              child: HookBuilder(
                builder: (context) {
                  useReaction<NetworkMode>((_) => store.currentMode, (mode) {
                    if (controller.page == 0 && mode != NetworkMode.connectingBT) {
                      controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeOutExpo);
                    } else if (controller.page == 1 && mode != NetworkMode.waitingNetworkInfo) {
                      controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeOutExpo);
                    }
                  });
                  return PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: controller,
                    children: [
                      Observer(builder: (context) {
                        if (store.btConnecting == null) {
                          return _Step1Explanations();
                        }
                        if (store.btConnecting!.status == FutureStatus.pending) {
                          return _StepLoading(message: localization.btConnecting);
                        }
                        if (store.btConnecting!.status == FutureStatus.rejected) {
                          return _StepError(
                            error: store.btConnecting!.error is NoDeviceException ? localization.noDeviceFound : store.btConnecting!.error.toString(),
                            onRetry: () => store.searchAndConnectToBTDevice(),
                          );
                        }
                        return Container();
                      }),
                      Observer(builder: (context) {
                        if (store.searchingNetworks.status == FutureStatus.pending) {
                          return _StepLoading(message: localization.networkSearching);
                        }
                        if (store.searchingNetworks.status == FutureStatus.rejected) {
                          return _StepError(
                            error: store.searchingNetworks.error,
                            onRetry: () => store.searchRemoteNetworks(),
                          );
                        }
                        return _Step2NetworkList();
                      }),
                      Observer(builder: (context) {
                        if (store.savingNetwork.status == FutureStatus.pending) {
                          return _StepLoading(message: localization.networkSaving);
                        }
                        if (store.savingNetwork.status == FutureStatus.rejected) {
                          return _StepError(
                            error: store.savingNetwork.error.toString(),
                            onRetry: () {
                              store.currentMode = NetworkMode.waitingNetworkInfo;
                              controller.animateToPage(1, duration: Duration(milliseconds: 400), curve: Curves.easeOutExpo);
                            },
                          );
                        }
                        return _Step3NetworkSaved();
                      }),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SetupStatusBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<SetupStore>(context);
    final primaryColor = Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Observer(
        builder: (context) {
          final mode = store.currentMode;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _LoadingIcon(
                icon: mode.index < NetworkMode.searchingNetworks.index ? Icons.bluetooth : Icons.bluetooth_connected,
                value: _getBTValue(mode),
                backgroundColor: mode.index < NetworkMode.searchingNetworks.index ? Colors.grey : primaryColor,
              ),
              Container(
                width: 40,
                height: 5,
                color: mode.index < NetworkMode.searchingNetworks.index ? Colors.grey : primaryColor,
              ),
              _LoadingIcon(
                icon: mode.index < NetworkMode.savingNetwork.index ? Icons.wifi_lock : Icons.wifi,
                value: _getWifiValue(mode),
                backgroundColor: mode.index < NetworkMode.savingNetwork.index ? Colors.grey : primaryColor,
              ),
              Container(
                width: 40,
                height: 5,
                color: mode.index < NetworkMode.savingNetwork.index ? Colors.grey : primaryColor,
              ),
              _LoadingIcon(
                icon: mode == NetworkMode.networkSaved ? Icons.link : Icons.link_off,
                value: _getLinkValue(mode),
                backgroundColor: mode == NetworkMode.networkSaved ? primaryColor : Colors.grey,
              ),
            ],
          );
        },
      ),
    );
  }

  double? _getBTValue(NetworkMode mode) {
    if (mode == NetworkMode.connectingBT) {
      return null;
    }

    if (mode.index > NetworkMode.connectingBT.index) {
      return 1;
    }

    return 0;
  }

  double? _getWifiValue(NetworkMode mode) {
    if (mode == NetworkMode.searchingNetworks) {
      return null;
    }

    if (mode.index > NetworkMode.searchingNetworks.index) {
      return 1;
    }

    return 0;
  }

  double? _getLinkValue(NetworkMode mode) {
    if (mode == NetworkMode.savingNetwork) {
      return null;
    }

    if (mode.index > NetworkMode.savingNetwork.index) {
      return 1;
    }

    return 0;
  }
}

class _LoadingIcon extends StatelessWidget {
  final IconData icon;
  final double? value;
  final Color backgroundColor;

  const _LoadingIcon({Key? key, required this.icon, this.value, required this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: CircleBorder(),
      color: backgroundColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(icon),
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              backgroundColor: Colors.grey,
              value: value,
            ),
          ),
        ],
      ),
    );
  }
}

class _Step1Explanations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<SetupStore>(context);
    final localization = CommonLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            localization.searchingBTDevice,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                store.searchAndConnectToBTDevice();
              },
              child: Text(localization.search.toUpperCase()),
            ),
          ),
        ],
      ),
    );
  }
}

class _Step2NetworkList extends StatelessWidget {
  IconData _getWiFiIcon(bool isOpen, int strength) {
    if (isOpen) {
      if (strength < 25) {
        return MaterialCommunityIcons.wifi_strength_1;
      } else if (strength < 50) {
        return MaterialCommunityIcons.wifi_strength_2;
      } else if (strength < 75) {
        return MaterialCommunityIcons.wifi_strength_3;
      } else {
        return MaterialCommunityIcons.wifi_strength_4;
      }
    } else {
      if (strength < 25) {
        return MaterialCommunityIcons.wifi_strength_1_lock;
      } else if (strength < 50) {
        return MaterialCommunityIcons.wifi_strength_2_lock;
      } else if (strength < 75) {
        return MaterialCommunityIcons.wifi_strength_3_lock;
      } else {
        return MaterialCommunityIcons.wifi_strength_4_lock;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<SetupStore>(context);
    final localization = CommonLocalizations.of(context);
    return Observer(builder: (context) {
      return ListView.separated(
        itemBuilder: (context, index) {
          final item = store.searchingNetworks.value![index];
          return ListTile(
            title: Text(item.ssid),
            onTap: () async {
              if (item.isOpen) {
                store.connectToNetwork(item.ssid, '');
              } else {
                final input = await showPrompt(context, localization.networkPasswordTitle(item.ssid));
                if (input != null) {
                  store.connectToNetwork(item.ssid, input);
                }
              }
            },
            leading: Icon(_getWiFiIcon(item.isOpen, item.signalStrength)),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: store.searchingNetworks.value!.length,
      );
    });
  }
}

class _Step3NetworkSaved extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localization = CommonLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        localization.boxConnected,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _StepLoading extends StatelessWidget {
  final String message;

  const _StepLoading({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(message, textAlign: TextAlign.center),
        ),
        Center(child: CircularProgressIndicator()),
      ],
    );
  }
}

class _StepError extends StatelessWidget {
  final String error;
  final VoidCallback? onRetry;

  const _StepError({Key? key, required this.error, this.onRetry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = CommonLocalizations.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            error,
            textAlign: TextAlign.center,
          ),
        ),
        if (onRetry != null)
          ElevatedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: onRetry,
            child: Text(localization.retry.toUpperCase()),
          )
      ],
    );
  }
}
