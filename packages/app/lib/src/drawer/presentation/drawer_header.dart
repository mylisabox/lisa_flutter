import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lisa_flutter/src/common/bloc/user_bloc.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_flutter/src/common/presentation/proxy_scaffold.dart';
import 'package:lisa_flutter/src/drawer/bloc/drawer_bloc.dart';
import 'package:lisa_flutter/src/profile/presentation/profile.dart';
import 'package:provider/provider.dart';
import 'package:proxy_layout/proxy_layout.dart';

class AppDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userBloc = Provider.of<UserBloc>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage('assets/images/bg_login_portrait.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kNormalPadding),
          child: Center(
            child: Observer(
              builder: (_) => Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: userBloc.avatar == null ? ExactAssetImage('assets/images/lisa.png') : NetworkImage(userBloc.avatar),
                    child: Material(
                      type: MaterialType.circle,
                      clipBehavior: Clip.hardEdge,
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          _goToProfile(context);
                        },
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          alignment: Alignment.bottomCenter,
                          child: Icon(
                            Icons.edit,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  FlatButton(
                    splashColor: Theme.of(context).primaryColor,
                    child: Text(userBloc.fullName, style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      _goToProfile(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _goToProfile(BuildContext context) {
    _closeDrawer(context);
    final drawerBloc = Provider.of<DrawerBloc>(context);
    if (drawerBloc.currentSelectedRoute != ProfileScreen.route) {
      if (DeviceProxy.isTablet(context)) {
        showPlatformDialog(context, (context) => ProfileDialog());
      } else {
        Provider.of<GlobalKey<NavigatorState>>(context).currentState.pushNamed(ProfileScreen.route);
        drawerBloc.selectRoute(ProfileScreen.route);
      }
    }
  }

  void _closeDrawer(BuildContext context) {
    if (ProxyScaffold.isMobileView(context)) {
      Navigator.of(context).pop();
    }
  }
}
