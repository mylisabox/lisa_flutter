import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_flutter/src/common/stores/user_store.dart';
import 'package:lisa_flutter/src/common/utils/extensions.dart';
import 'package:lisa_flutter/src/login/presentation/login_screen.dart';
import 'package:lisa_flutter/src/profile/presentation/profile.dart';
import 'package:lisa_flutter/src/settings/presentation/settings.dart';
import 'package:lisa_flutter/src/settings/stores/settings_store.dart';

class UserDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userStore = context.of<UserStore>();
    return Dialog(
      insetPadding: const EdgeInsets.all(24.0),
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kNormalPadding),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Align(
          alignment: Alignment.topCenter,
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kSmallPadding),
                  ),
                  color: context.theme.dialogBackgroundColor,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            splashRadius: 25,
                            onPressed: () {
                              context.navigator.pop();
                            },
                            icon: Icon(Icons.close, color: context.brightnessColor),
                          ),
                        ],
                      ),
                      _UserDialogContent(),
                    ],
                  ),
                ),
              ),
              Hero(
                tag: 'userAvatar',
                child: SizedBox(
                  height: 60,
                  child: Center(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: context.primaryColor,
                      backgroundImage: userStore.avatar == null ? null : NetworkImage(userStore.avatar!),
                      child: userStore.avatar == null
                          ? Icon(
                              Icons.person,
                              color: context.brightnessColor,
                              size: 40,
                            )
                          : const SizedBox(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UserDialogContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: kNormalPadding),
          child: OutlinedButton(
            onPressed: () {
              context.navigator.pushNamed(ProfileScreen.route);
            },
            child: Text(
              context.localizations.manageProfile,
              style: TextStyle(color: context.brightnessColor),
            ),
          ),
        ),
        Divider(height: 1, color: context.dividerColor),
        ListTile(
          leading: Icon(Icons.settings_outlined, color: context.brightnessColor),
          title: Text(context.localizations.manageSettings),
          onTap: () {
            context.navigator.pushNamed(SettingsScreen.route);
          },
        ),
        Divider(height: 1, color: context.dividerColor),
        Observer(
          builder: (context) {
            final prefStore = context.of<SettingsStore>();
            return ListTile(
              leading: Icon(Icons.dark_mode_outlined, color: context.brightnessColor),
              trailing: Switch(
                onChanged: (bool value) {
                  prefStore.setDarkTheme(value);
                },
                value: prefStore.isDarkTheme,
              ),
              onTap: () {
                prefStore.setDarkTheme(!prefStore.isDarkTheme);
              },
              title: Text(context.localizations.menuDarkMode),
            );
          },
        ),
        Divider(height: 1, color: context.dividerColor),
        ListTile(
          leading: Icon(Icons.logout_outlined, color: context.brightnessColor),
          onTap: () async {
            final logout = await showConfirm(context, context.localizations.menuLogout, context.localizations.logoutConfirm);
            if (logout) {
              final success =
                  await showLoadingDialog(context, (_) => Text(context.localizations.menuLogout), () => context.of<UserStore>(listen: false).logout());
              if (success) {
                Navigator.of(context, rootNavigator: true).popUntil((_) => true);
                Navigator.of(context, rootNavigator: true).pushReplacementNamed(LoginScreen.route);
              }
            }
          },
          title: Text(context.localizations.menuLogout),
        ),
        Divider(height: 1, color: context.dividerColor),
        TextButton(
          onPressed: () {
            context.navigator.push(MaterialPageRoute(builder: (_) => LicensePage(), settings: RouteSettings(name: '/licenses')));
          },
          child: Text(
            context.localizations.seeLicenses,
            style: TextStyle(color: context.brightnessColor),
          ),
        ),
      ],
    );
  }
}
