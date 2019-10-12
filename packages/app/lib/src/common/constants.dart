import 'dart:ui';

import 'package:logging/logging.dart';

const bool kIsProductionMode = bool.fromEnvironment('dart.vm.product');

const kNetworkDebug = !kIsProductionMode;
const kAuthKey = 'Bearer';

final kDebugLogger = Logger('Lisa');

final kSupportedLanguages = [
  const Locale('en', 'US'), // English
  const Locale('fr', 'FR'), // French
];

const double kSmallPadding = 8.0;
const double kMediumPadding = 12.0;
const double kNormalPadding = 15.0;
const double kBigPadding = 32.0;
const double kHugePadding = 54.0;
