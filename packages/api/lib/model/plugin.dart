//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:lisa_server_sdk/model/device_settings.dart';

part 'plugin.g.dart';

abstract class Plugin implements Built<Plugin, PluginBuilder> {

    @BuiltValueField(wireName: r'id')
    String get id;

    @BuiltValueField(wireName: r'name')
    String get name;

    @nullable
    @BuiltValueField(wireName: r'description')
    String get description;

    @nullable
    @BuiltValueField(wireName: r'image')
    String get image;

    @BuiltValueField(wireName: r'devicesSettings')
    BuiltList<DeviceSettings> get devicesSettings;

    // Boilerplate code needed to wire-up generated code
    Plugin._();

    static void _initializeBuilder(PluginBuilder b) => b;

    factory Plugin([void updates(PluginBuilder b)]) = _$Plugin;
    static Serializer<Plugin> get serializer => _$pluginSerializer;
}

