import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sickchill/flutter_sickchill.dart';
import 'package:flutter_transmission/flutter_transmission.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:proxy_layout/proxy_layout.dart';

class MultimediaWidget extends HookWidget {
  static const route = '/multimedia';
  static const routeSickChill = '/multimedia/sickchill';
  static const routeSickChillShow = '/sickchill/';
  static const routeTransmission = '/multimedia/transmission';

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  Widget build(BuildContext context) {
    final translations = CommonLocalizations.of(context);
    return Scaffold(
      primary: false,
      body: Column(
        children: [
          ListTile(
            title: Text('Transmission'),
            onTap: () {
              final isMobile = DeviceProxy.isMobile(context);
              final color = HSLColor.fromColor(Theme.of(context).primaryColor).withLightness(0.3);
              Navigator.of(context, rootNavigator: isMobile).push(MaterialPageRoute(builder: (context) => TransmissionScreen(headless: !isMobile, iconActiveColor: color.toColor()), settings: RouteSettings(name: routeTransmission)));
            },
          ),
          Divider(height: 1,),
          ListTile(
            title: Text('SickChill'),
            onTap: () {
              final isMobile = DeviceProxy.isMobile(context);
              Navigator.of(context, rootNavigator: isMobile).push(MaterialPageRoute(builder: (context) => SickChillScreen(headless: !isMobile), settings: RouteSettings(name: routeSickChill)));
            },
          ),
        ],
      ),
    );
  }
}
