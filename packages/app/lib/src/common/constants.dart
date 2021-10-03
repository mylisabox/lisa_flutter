import 'dart:ui';

import 'package:flutter/material.dart';
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

const int kHoursBeforeFingerprint = 3;

const Color kDisabledColor = Color(0xFF616161); // = grey.shade700

extension HexToColor on String {
  Color toColor() {
    final hexColorTrim = toUpperCase().replaceAll('#', '').replaceAll('0X', '').padLeft(8, 'F');
    return Color(int.parse(hexColorTrim, radix: 16));
  }
}

extension ColorToHex on Color {
  String toHex({bool includeAlpha=true}) {
    final hex = '#${value.toRadixString(16)}';
    if (includeAlpha) {
      return hex;
    }
    return hex.replaceFirst('#ff', '#');
  }
}
