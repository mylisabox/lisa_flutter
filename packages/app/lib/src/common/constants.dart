import 'dart:ui';

import 'package:logging/logging.dart';

const bool kIsProductionMode = bool.fromEnvironment('dart.vm.product');

const kNetworkDebug = !kIsProductionMode;

final kDebugLogger = Logger('Lisa');

//const kSupportedLanguages = ['en', 'fr'];
final kSupportedLanguages = [
  const Locale('en', 'US'), // English
  const Locale('fr', 'FR'), // French
];

const double kSmallPadding = 8.0;
const double kNormalPadding = 16.0;
const double kBigPadding = 32.0;