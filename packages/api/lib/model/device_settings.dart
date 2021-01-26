//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'device_settings.g.dart';

abstract class DeviceSettings implements Built<DeviceSettings, DeviceSettingsBuilder> {

    @BuiltValueField(wireName: r'name')
    String get name;

    @BuiltValueField(wireName: r'driver')
    String get driver;

    @BuiltValueField(wireName: r'image')
    String get image;

    @BuiltValueField(wireName: r'pairing')
    String get pairing;

    @BuiltValueField(wireName: r'pluginName')
    String get pluginName;

    @BuiltValueField(wireName: r'description')
    String get description;

    @nullable
    @BuiltValueField(wireName: r'type')
    String get type;

    @BuiltValueField(wireName: r'template')
    BuiltMap<String, JsonObject> get template;

    @nullable
    @BuiltValueField(wireName: r'settings')
    BuiltMap<String, JsonObject> get settings;

    // Boilerplate code needed to wire-up generated code
    DeviceSettings._();

    static void _initializeBuilder(DeviceSettingsBuilder b) => b;

    factory DeviceSettings([void updates(DeviceSettingsBuilder b)]) = _$DeviceSettings;
    static Serializer<DeviceSettings> get serializer => _$deviceSettingsSerializer;
}

