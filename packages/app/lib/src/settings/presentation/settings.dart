import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_flutter/src/common/presentation/file_fields/file_field.dart';
import 'package:lisa_flutter/src/plugins/presentation/plugins.dart';
import 'package:lisa_flutter/src/settings/stores/settings_store.dart';
import 'package:provider/provider.dart';

class SettingsWidget extends HookWidget {
  static const route = '/settings';

  @override
  Widget build(BuildContext context) {
    final translations = CommonLocalizations.of(context);
    final settingStore = useMemoized(() => SettingsStore());

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
                    await _showFilePickerDialog(context);
                  },
                  leading: Icon(Icons.mic),
                  title: Text(translations.voiceCommand),
                  subtitle: Text(translations.voiceCommandDesc),
                ),
                Divider(height: 1),
                ListTile(
                  onTap: () async {
                    Provider.of<GlobalKey<NavigatorState>>(context, listen: false).currentState.pushNamed(PluginsStoreWidget.route);
                  },
                  leading: Icon(Icons.shop),
                  title: Text(translations.pluginShop),
                  subtitle: Text(translations.pluginShopDesc),
                ),
                Divider(height: 1),
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
  Uint8List data;
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
