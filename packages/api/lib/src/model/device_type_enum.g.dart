// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_type_enum.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DeviceTypeEnum _$light = const DeviceTypeEnum._('light');
const DeviceTypeEnum _$webcam = const DeviceTypeEnum._('webcam');
const DeviceTypeEnum _$thermostat = const DeviceTypeEnum._('thermostat');
const DeviceTypeEnum _$shutter = const DeviceTypeEnum._('shutter');
const DeviceTypeEnum _$sensor = const DeviceTypeEnum._('sensor');
const DeviceTypeEnum _$media = const DeviceTypeEnum._('media');
const DeviceTypeEnum _$speaker = const DeviceTypeEnum._('speaker');
const DeviceTypeEnum _$other = const DeviceTypeEnum._('other');

DeviceTypeEnum _$valueOf(String name) {
  switch (name) {
    case 'light':
      return _$light;
    case 'webcam':
      return _$webcam;
    case 'thermostat':
      return _$thermostat;
    case 'shutter':
      return _$shutter;
    case 'sensor':
      return _$sensor;
    case 'media':
      return _$media;
    case 'speaker':
      return _$speaker;
    case 'other':
      return _$other;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<DeviceTypeEnum> _$values =
    new BuiltSet<DeviceTypeEnum>(const <DeviceTypeEnum>[
  _$light,
  _$webcam,
  _$thermostat,
  _$shutter,
  _$sensor,
  _$media,
  _$speaker,
  _$other,
]);

class _$DeviceTypeEnumMeta {
  const _$DeviceTypeEnumMeta();
  DeviceTypeEnum get light => _$light;
  DeviceTypeEnum get webcam => _$webcam;
  DeviceTypeEnum get thermostat => _$thermostat;
  DeviceTypeEnum get shutter => _$shutter;
  DeviceTypeEnum get sensor => _$sensor;
  DeviceTypeEnum get media => _$media;
  DeviceTypeEnum get speaker => _$speaker;
  DeviceTypeEnum get other => _$other;
  DeviceTypeEnum valueOf(String name) => _$valueOf(name);
  BuiltSet<DeviceTypeEnum> get values => _$values;
}

abstract class _$DeviceTypeEnumMixin {
  // ignore: non_constant_identifier_names
  _$DeviceTypeEnumMeta get DeviceTypeEnum => const _$DeviceTypeEnumMeta();
}

Serializer<DeviceTypeEnum> _$deviceTypeEnumSerializer =
    new _$DeviceTypeEnumSerializer();

class _$DeviceTypeEnumSerializer
    implements PrimitiveSerializer<DeviceTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'light': 'light',
    'webcam': 'webcam',
    'thermostat': 'thermostat',
    'shutter': 'shutter',
    'sensor': 'sensor',
    'media': 'media',
    'speaker': 'speaker',
    'other': 'other',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'light': 'light',
    'webcam': 'webcam',
    'thermostat': 'thermostat',
    'shutter': 'shutter',
    'sensor': 'sensor',
    'media': 'media',
    'speaker': 'speaker',
    'other': 'other',
  };

  @override
  final Iterable<Type> types = const <Type>[DeviceTypeEnum];
  @override
  final String wireName = 'DeviceTypeEnum';

  @override
  Object serialize(Serializers serializers, DeviceTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  DeviceTypeEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      DeviceTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
