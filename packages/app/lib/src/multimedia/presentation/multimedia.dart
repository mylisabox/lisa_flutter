import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';

class MultimediaWidget extends HookWidget {
  static const route = '/multimedia';

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

            },
          ),
          Divider(height: 1,),
          ListTile(
            title: Text('SickChill'),
            onTap: () {

            },
          ),
        ],
      ),
    );
  }
}
