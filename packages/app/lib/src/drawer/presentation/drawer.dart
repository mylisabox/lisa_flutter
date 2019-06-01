import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lisa_flutter/src/common/bloc/user_bloc.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_flutter/src/common/presentation/proxy_scaffold.dart';
import 'package:lisa_flutter/src/drawer/bloc/drawer_bloc.dart';
import 'package:lisa_flutter/src/drawer/presentation/drawer_header.dart';
import 'package:lisa_flutter/src/drawer/presentation/room_list.dart';
import 'package:lisa_flutter/src/favorites/presentation/favorites.dart';
import 'package:lisa_flutter/src/login/presentation/login_screen.dart';
import 'package:lisa_flutter/src/preferences/bloc/preferences_bloc.dart';
import 'package:lisa_flutter/src/preferences/presentation/preferences.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefsBloc = Provider.of<PreferencesBloc>(context);
    final drawerBloc = Provider.of<DrawerBloc>(context);
    final translations = CommonLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        AppDrawerHeader(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                DrawerEntry(
                  text: translations.menuFavorite,
                  icon: Icons.star_border,
                  onTap: () {
                    if (drawerBloc.currentSelectedRoute != FavoritesWidget.route) {
                      Provider.of<GlobalKey<NavigatorState>>(context).currentState.pushNamed(FavoritesWidget.route);
                      _closeDrawer(context);
                      drawerBloc.selectRoute(FavoritesWidget.route);
                    }
                  },
                ),
                Divider(height: 1),
                RoomList(),
                /*
                Divider(height: 1),
                DrawerEntry(
                  text: translations.menuOrphans,
                  icon: Icons.device_hub,
                  onTap: () {
                    if (drawerBloc.currentSelectedRoute != OrphansWidget.route) {
                      Provider.of<GlobalKey<NavigatorState>>(context).currentState.pushNamed(OrphansWidget.route);
                      _closeDrawer(context);
                      drawerBloc.selectRoute(OrphansWidget.route);
                    }
                  },
                ),*/
                Divider(height: 1),
                DrawerEntry(
                  text: translations.menuPreferences,
                  icon: Icons.settings,
                  onTap: () {
                    if (drawerBloc.currentSelectedRoute != PreferencesWidget.route) {
                      Provider.of<GlobalKey<NavigatorState>>(context).currentState.pushNamed(PreferencesWidget.route);
                      _closeDrawer(context);
                      drawerBloc.selectRoute(PreferencesWidget.route);
                    }
                  },
                ),
                Divider(height: 1),
                DrawerEntry(
                  text: translations.menuLogout,
                  icon: Icons.power_settings_new,
                  onTap: () async {
                    final logout = await showConfirm(context, translations.menuLogout, translations.logoutConfirm);
                    if (logout) {
                      //FIXME show loading
                      await Provider.of<UserBloc>(context).logout();
                      Navigator.of(context, rootNavigator: true).popUntil((_) => true);
                      Navigator.of(context, rootNavigator: true).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
                    }
                  },
                ),
                Divider(height: 1),
                DrawerEntry(
                  text: translations.menuNightMode,
                  icon: Icons.local_hotel,
                  trailing: SizedBox.fromSize(
                    child: Observer(
                      builder: (context) => Switch.adaptive(
                            activeColor: Theme.of(context).primaryColor,
                            value: prefsBloc.isDarkTheme,
                            onChanged: (value) {
                              prefsBloc.setDarkTheme(value);
                            },
                          ),
                    ),
                    size: Size(60, 20),
                  ),
                ),
                Divider(height: 1),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _closeDrawer(BuildContext context) {
    if (ProxyScaffold.isMobileView(context)) {
      Navigator.of(context).pop();
    }
  }
}

class DrawerEntry extends StatelessWidget {
  static const height = 55.0;
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  final Widget trailing;

  const DrawerEntry({Key key, this.icon, this.text, this.onTap, this.trailing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(kNormalPadding),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: kNormalPadding),
                child: Icon(
                  icon,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Expanded(
                child: Text(
                  text.toUpperCase(),
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
              if (trailing != null) trailing
            ],
          ),
        ),
      ),
    );
  }
}