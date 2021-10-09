import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_flutter/src/common/presentation/file_fields/file_field.dart';
import 'package:lisa_flutter/src/common/utils/extensions.dart';
import 'package:lisa_flutter/src/config/routes.dart';
import 'package:lisa_flutter/src/plugins/presentation/plugins.dart';
import 'package:lisa_flutter/src/rooms/presentation/rooms_settings.dart';
import 'package:lisa_flutter/src/settings/stores/settings_store.dart';
import 'package:provider/provider.dart';

class HomeSettingsScreen extends HookWidget {
  static const route = '/homeSettings';

  const HomeSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.menuHomeSettings),
      ),
      body: const HomeSettingsWidget(),
    );
  }
}

class HomeSettingsWidget extends HookWidget {
  const HomeSettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ListTile(
        onTap: () {
          context.navigator.pushNamed(RoomsSettingsScreen.route, arguments: RouteArguments(type: RouteTransitionType.fromBottom));
        },
        leading: const Icon(Icons.meeting_room_outlined),
        title: Text(context.localizations.menuRooms),
        subtitle: Text(context.localizations.menuRoomsDescription),
      ),
      const Divider(height: 1),
    ]);
  }
}

class SettingsScreen extends HookWidget {
  static const route = '/settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
        title: Text(context.localizations.menuSettings),
      ),
      body: const SettingsWidget(),
    );
  }
}

class SettingsWidget extends HookWidget {
  static const route = '/settings';

  const SettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translations = CommonLocalizations.of(context);
    final settingStore = context.of<SettingsStore>();

    return Provider.value(
      value: settingStore,
      child: Builder(
        builder: (context) => Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Material(
            color: Colors.transparent,
            child: Column(
              children: <Widget>[
                ListTile(
                  onTap: () async {
                    final url =
                        await showPrompt(context, translations.externalUrl, hint: translations.externalUrlHint, initialValue: settingStore.externalBaseUrl);
                    if (url != null) {
                      settingStore.setExternalUrl(url);
                    }
                  },
                  leading: const Icon(Icons.settings_remote),
                  title: Text(translations.externalUrl),
                  subtitle: Text(translations.linkExternalUrl),
                ),
                const Divider(height: 1),
                ListTile(
                  onTap: () async {
                    await _showFilePickerDialog(context);
                  },
                  leading: const Icon(Icons.mic),
                  title: Text(translations.voiceCommand),
                  subtitle: Text(translations.voiceCommandDesc),
                ),
                const Divider(height: 1),
                ListTile(
                  onTap: () async {
                    context.navigator.pushNamed(PluginsStoreScreen.route);
                  },
                  leading: const Icon(Icons.shop),
                  title: Text(translations.pluginShop),
                  subtitle: Text(translations.pluginShopDesc),
                ),
                const Divider(height: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _showFilePickerDialog(BuildContext context) {
  final translations = CommonLocalizations.of(context);
  final store = Provider.of<SettingsStore>(context, listen: false);
  String name = '';
  late Uint8List data;
  return showAppDialog(
      context,
      (_) => Text(translations.voiceCommandSetupTitle),
      (_) => HookBuilder(
            builder: (context) {
              final nameState = useState(name);
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(translations.voiceCommandSetupDesc),
                  FileField.create(onFileSelected: (fileData, fileName) {
                    name = fileName;
                    data = fileData;
                    nameState.value = name;
                  }),
                  if (name.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Align(
                        child: Text(translations.chosenFile(name)),
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                ],
              );
            },
          ),
      actions: [
        DialogAction(
          text: MaterialLocalizations.of(context).cancelButtonLabel,
          callback: (context) {
            Navigator.of(context).pop(null);
          },
        ),
        DialogAction(
          isDefaultAction: true,
          text: MaterialLocalizations.of(context).okButtonLabel,
          callback: (context) async {
            final success = await showLoadingDialog(context, (_) => Text(translations.saving), () => store.saveVoiceCommandsConfig(data));
            if (success) {
              Navigator.of(context).pop(true);
            }
          },
        ),
      ]);
}
