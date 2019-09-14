import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

Future<String> getMainDirectory() async {
  String appDocPath = '.';
  if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android) {
    final appDocDir = await getApplicationDocumentsDirectory();
    appDocPath = appDocDir.path;
  }
  return appDocPath;
}
