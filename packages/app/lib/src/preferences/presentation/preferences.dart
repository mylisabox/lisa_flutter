import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lisa_flutter/src/common/bloc/user_bloc.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_flutter/src/preferences/bloc/preferences_bloc.dart';
import 'package:provider/provider.dart';

class PreferencesWidget extends HookWidget {
  static const route = '/preferences';

  @override
  Widget build(BuildContext context) {
    final translations = CommonLocalizations.of(context);
    final userBloc = Provider.of<UserBloc>(context);

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: <Widget>[
            Observer(
              builder: (context) => ListTile(
                onTap: () async {
                  final selected = await showSelectDialog(
                    context,
                    (_) => Text(translations.prefLanguage),
                    kSupportedLanguages,
                    (context, index) {
                      return Text(kSupportedLanguages[index].languageCode);
                    },
                    barrierDismissible: false,
                  );
                  await showLoadingDialog(
                    context,
                    (_) => Text(translations.saving),
                    () => userBloc.changeLang(selected.languageCode),
                    onError: (err) => showErrorDialog(context, err, null),
                  );
                },
                leading: Icon(Icons.language),
                title: Text(translations.prefLanguage),
                subtitle: Text(translations.prefLanguageDesc),
                trailing: Text(
                  userBloc.lang ?? Localizations.localeOf(context).languageCode,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            Divider(height: 1),
            ListTile(
              onTap: () async {
                final url = await showPrompt(context, translations.externalUrl, hint: translations.externalUrlHint);
                if (url != null) {
                  Provider.of<PreferencesBloc>(context).setExternalUrl(url);
                }
              },
              leading: Icon(Icons.settings_remote),
              title: Text(translations.externalUrl),
              subtitle: Text(translations.linkExternalUrl),
            ),
            Divider(height: 1),
          ],
        ),
      ),
    );
  }
}