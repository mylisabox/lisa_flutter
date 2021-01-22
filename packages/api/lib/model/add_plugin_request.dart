//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'add_plugin_request.g.dart';

abstract class AddPluginRequest implements Built<AddPluginRequest, AddPluginRequestBuilder> {

    @BuiltValueField(wireName: r'id')
    String get id;

    @BuiltValueField(wireName: r'version')
    String get version;

    @BuiltValueField(wireName: r'from')
    String get from;

    // Boilerplate code needed to wire-up generated code
    AddPluginRequest._();

    static void _initializeBuilder(AddPluginRequestBuilder b) => b;

    factory AddPluginRequest([void updates(AddPluginRequestBuilder b)]) = _$AddPluginRequest;
    static Serializer<AddPluginRequest> get serializer => _$addPluginRequestSerializer;
}

