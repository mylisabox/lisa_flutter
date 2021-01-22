import 'dart:collection';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:logging/logging.dart';
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:sentry/sentry.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

const _logFilter = [];
const _memLogMaxLines = 500;
final _memLogDateFormatter = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
final _logs = Queue<String>();

void initLogger() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(_log);
}

void _memLog(LogRecord record) {
  // only keep last n lines
  if (_logs.length >= _memLogMaxLines) {
    _logs.removeFirst();
  }

  var level = '?';
  switch (record.level.value) {
    case 300:
      level = 'T';
      break;
    case 400:
    case 500:
      level = 'D';
      break;
    case 800:
      level = 'I';
      break;
    case 900:
      level = 'W';
      break;
    case 1000:
      level = 'E';
      break;
    case 1200:
      level = 'WTF';
      break;
  }

  _logs.add(
      '${_memLogDateFormatter.format(DateTime.now())} $level/${record.loggerName} ${record.message}');

  if (record.error != null) {
    _logs.add(record.error.toString());
  }

  if (record.stackTrace != null && record.level == Level.SEVERE) {
    _logs.add(record.stackTrace.toString());
  }
}

String _currentVersion;

void _log(LogRecord record) async {
  // log to crashlytics
  if (kIsProductionMode) {
    _memLog(record);
  }

  if (_currentVersion == null) {
    final pubSpecTxt = await rootBundle.loadString('pubspec.yaml');
    final pubSpec = Pubspec.parse(pubSpecTxt);
    _currentVersion = pubSpec.version.toString();
  }

  // send as crash to crashlytics if severe
  if (kIsProductionMode &&
      record.level >= Level.SEVERE &&
      record.stackTrace != null) {
    await Sentry.captureEvent(
      SentryEvent(
        release: _currentVersion,
        extra: {'log': _logs.toList(growable: false)},
        culprit: record.error.toString(),
        logger: record.loggerName,
        exception: record.error,
      ),
      stackTrace: record.stackTrace,
    );
    _logs.clear();
  } else if (!kIsProductionMode) {
    // now, log!
    if (record.stackTrace != null) {
      log(record.message,
          name: record.loggerName,
          level: record.level.value,
          error: record.error,
          stackTrace: record.stackTrace,
          time: DateTime.now());
      debugPrint(
          record.message.toString()); //FIXME until IDE plugin does it for us
      debugPrint(
          record.error.toString()); //FIXME until IDE plugin does it for us
      print(
          record.stackTrace.toString()); //FIXME until IDE plugin does it for us
    } else {
      if (_logFilter.isEmpty ||
          _logFilter.contains(record.loggerName) ||
          kIsProductionMode) {
        log(record.message,
            name: record.loggerName,
            level: record.level.value,
            time: DateTime.now());
      }
    }
  }
}
