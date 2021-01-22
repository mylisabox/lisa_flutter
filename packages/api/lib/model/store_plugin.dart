//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'store_plugin.g.dart';

abstract class StorePlugin implements Built<StorePlugin, StorePluginBuilder> {

    @BuiltValueField(wireName: r'id')
    String get id;

    @BuiltValueField(wireName: r'name')
    String get name;

    @BuiltValueField(wireName: r'description')
    String get description;

    @BuiltValueField(wireName: r'installed')
    bool get installed;

    // Boilerplate code needed to wire-up generated code
    StorePlugin._();

    static void _initializeBuilder(StorePluginBuilder b) => b;

    factory StorePlugin([void updates(StorePluginBuilder b)]) = _$StorePlugin;
    static Serializer<StorePlugin> get serializer => _$storePluginSerializer;
}

