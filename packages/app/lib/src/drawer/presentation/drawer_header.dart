import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_flutter/src/common/presentation/proxy_scaffold.dart';
import 'package:lisa_flutter/src/common/stores/user_store.dart';
import 'package:lisa_flutter/src/drawer/stores/drawer_store.dart';
import 'package:lisa_flutter/src/profile/presentation/profile.dart';
import 'package:provider/provider.dart';
import 'package:proxy_layout/proxy_layout.dart';

class AppDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);
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
                    backgroundImage: userStore.avatar == null ? ExactAssetImage('assets/images/lisa.png') : NetworkImage(userStore.avatar),
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
                  TextButton(
                    child: Text(userStore.fullName, style: TextStyle(color: Colors.white)),
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
    final drawerStore = Provider.of<DrawerStore>(context, listen: false);
    if (drawerStore.currentSelectedRoute != ProfileScreen.route) {
      if (DeviceProxy.isTablet(context)) {
        showPlatformDialog(context, (context) => ProfileDialog());
      } else {
        Navigator.of(context, rootNavigator: true).pushNamed(ProfileScreen.route);
        drawerStore.selectRoute(ProfileScreen.route);
      }
    }
  }

  void _closeDrawer(BuildContext context) {
    if (ProxyScaffold.isMobileView(context)) {
      Navigator.of(context).pop();
    }
  }
}
