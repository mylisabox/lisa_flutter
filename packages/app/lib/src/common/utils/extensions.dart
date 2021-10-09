import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:flutter/material.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_server_sdk/lisa_server_sdk.dart';
import 'package:provider/provider.dart';

extension BuildContextExtension on BuildContext {
  CommonLocalizations get localizations => CommonLocalizations.of(this);

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  Color get primaryColor => Theme.of(this).primaryColor;

  NavigatorState get navigator => Navigator.of(this);

  NavigatorState get rootNavigator => Navigator.of(this, rootNavigator: true);

  T of<T>({bool listen = true}) => Provider.of<T>(this, listen: listen);

  Color get brightnessColor => theme.brightness == Brightness.dark ? Colors.white : Colors.black87;

  Color get dividerColor => brightnessColor.withOpacity(0.5);
}

extension DeviceExtension on Device {
  static String _getAction(DeviceTypeEnum type, bool on) {
    switch (type) {
      case DeviceTypeEnum.light:
        return on ? 'Turn off' : 'Turn on';
      case DeviceTypeEnum.media:
      case DeviceTypeEnum.other:
      case DeviceTypeEnum.sensor:
      case DeviceTypeEnum.webcam:
      case DeviceTypeEnum.thermostat:
        break;
      case DeviceTypeEnum.shutter:
        return on ? 'Close' : 'Open';
      case DeviceTypeEnum.speaker:
        return on ? 'Pause' : 'Play';
    }
    return '';
  }

  static Device createGroup(
    List<Device> devices,
    String name,
    int sortOrder,
  ) {
    var powered = false;
    late DeviceTypeEnum type;
    for (var d in devices) {
      if (d.powered) {
        powered = d.powered;
      }
      if (d.sortOrder < sortOrder) {
        sortOrder = d.sortOrder;
      }
      type = d.type;
    }
    return (DeviceBuilder()
          ..id = -1
          ..sortOrder = sortOrder
          ..pluginName = 'none'
          ..powered = powered
          ..type = type
          ..grouped = true
          ..data = devices.first.data == null ? null : MapBuilder(devices.first.data)
          ..groupCount = devices.length
          ..roomId = devices.first.roomId
          ..defaultAction = _getAction(type, powered)
          ..name = name
          ..children = ListBuilder(devices)
          ..imageOn = getImage(devices.first.type, true, grouped: true)
          ..imageOff = getImage(devices.first.type, false, grouped: true))
        .build();
  }

  static String? getImage(DeviceTypeEnum type, bool on, {bool grouped = false}) {
    switch (type) {
      case DeviceTypeEnum.light:
        if (grouped) return 'assets/images/widgets/group_bulbs_${on ? 'on' : 'off'}.svg';
        return 'assets/images/widgets/bulb_${on ? 'on' : 'off'}.svg';
      case DeviceTypeEnum.shutter:
        if (grouped) return 'assets/images/widgets/group_shutters_${on ? 'on' : 'off'}.svg';
        return 'assets/images/widgets/shutter_${on ? 'on' : 'off'}.svg';
      case DeviceTypeEnum.speaker:
        if (grouped) return 'assets/images/widgets/group_speakers_${on ? 'on' : 'off'}.svg';
        return 'assets/images/widgets/speaker_${on ? 'on' : 'off'}.svg';
      case DeviceTypeEnum.media:
        // TODO: Handle this case.
        break;
      case DeviceTypeEnum.other:
        // TODO: Handle this case.
        break;
      case DeviceTypeEnum.sensor:
        // TODO: Handle this case.
        break;
      case DeviceTypeEnum.thermostat:
        // TODO: Handle this case.
        break;
      case DeviceTypeEnum.webcam:
        // TODO: Handle this case.
        break;
    }
    return null;
  }
}

extension JsonObjectExtension on JsonObject {
  dynamic toPrimitive() {
    dynamic val;
    if (this is StringJsonObject) {
      val = asString;
    } else if (this is NumJsonObject) {
      val = asNum;
    } else if (this is MapJsonObject) {
      val = asMap;
    } else if (this is BoolJsonObject) {
      val = asBool;
    } else if (this is ListJsonObject) {
      val = asList;
    }
    return val;
  }
}
