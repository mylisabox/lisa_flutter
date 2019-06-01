import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_crashlytics/flutter_crashlytics.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:logging/logging.dart';

const _logFilter = ['TitleHandler', 'FavoritesWidget', 'TitleNavigatorObserver'];

void initLogger() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(_log);
}

void _log(LogRecord record) async {
  // log to crashlytics
  if (kIsProductionMode) {
    await FlutterCrashlytics().log(record.message, priority: record.level.value, tag: record.loggerName);
  }

  // send as crash to crashlytics if severe
  if (kIsProductionMode && record.level >= Level.SEVERE && record.stackTrace != null) {
    await FlutterCrashlytics().reportCrash(record.error, record.stackTrace, forceCrash: false);
  } else if (!kIsProductionMode) {
    // now, log!
    if (record.stackTrace != null) {
      log(record.message, name: record.loggerName, level: record.level.value, error: record.error, stackTrace: record.stackTrace, time: DateTime.now());
      debugPrint(record.message.toString()); //FIXME until IDE plugin does it for us
      debugPrint(record.error.toString()); //FIXME until IDE plugin does it for us
      print(record.stackTrace.toString()); //FIXME until IDE plugin does it for us
    } else {
      if (_logFilter.isEmpty || _logFilter.contains(record.loggerName) || kIsProductionMode) {
        log(record.message, name: record.loggerName, level: record.level.value, time: DateTime.now());
      }
    }
  }
}
