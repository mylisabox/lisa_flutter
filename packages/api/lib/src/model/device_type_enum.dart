//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'device_type_enum.g.dart';

class DeviceTypeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'light')
  static const DeviceTypeEnum light = _$light;
  @BuiltValueEnumConst(wireName: r'webcam')
  static const DeviceTypeEnum webcam = _$webcam;
  @BuiltValueEnumConst(wireName: r'thermostat')
  static const DeviceTypeEnum thermostat = _$thermostat;
  @BuiltValueEnumConst(wireName: r'shutter')
  static const DeviceTypeEnum shutter = _$shutter;
  @BuiltValueEnumConst(wireName: r'sensor')
  static const DeviceTypeEnum sensor = _$sensor;
  @BuiltValueEnumConst(wireName: r'media')
  static const DeviceTypeEnum media = _$media;
  @BuiltValueEnumConst(wireName: r'speaker')
  static const DeviceTypeEnum speaker = _$speaker;
  @BuiltValueEnumConst(wireName: r'other')
  static const DeviceTypeEnum other = _$other;

  static Serializer<DeviceTypeEnum> get serializer => _$deviceTypeEnumSerializer;

  const DeviceTypeEnum._(String name): super(name);

  static BuiltSet<DeviceTypeEnum> get values => _$values;
  static DeviceTypeEnum valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class DeviceTypeEnumMixin = Object with _$DeviceTypeEnumMixin;

