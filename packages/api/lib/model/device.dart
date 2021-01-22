//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';

part 'device.g.dart';

abstract class Device implements Built<Device, DeviceBuilder> {

    @BuiltValueField(wireName: r'id')
    int get id;

    @BuiltValueField(wireName: r'roomId')
    int get roomId;

    @BuiltValueField(wireName: r'name')
    String get name;

    @nullable
    @BuiltValueField(wireName: r'driver')
    String get driver;

    @nullable
    @BuiltValueField(wireName: r'pluginName')
    String get pluginName;

    @BuiltValueField(wireName: r'type')
    String get type;

    @BuiltValueField(wireName: r'template')
    BuiltMap<String, JsonObject> get template;

    @BuiltValueField(wireName: r'data')
    BuiltMap<String, JsonObject> get data;

    @BuiltValueField(wireName: r'favorite')
    bool get favorite;

    // Boilerplate code needed to wire-up generated code
    Device._();

    static void _initializeBuilder(DeviceBuilder b) => b
        ..favorite = false;

    factory Device([void updates(DeviceBuilder b)]) = _$Device;
    static Serializer<Device> get serializer => _$deviceSerializer;
}

