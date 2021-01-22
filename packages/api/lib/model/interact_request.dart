//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';

part 'interact_request.g.dart';

abstract class InteractRequest implements Built<InteractRequest, InteractRequestBuilder> {

    @BuiltValueField(wireName: r'sentence')
    String get sentence;

    @BuiltValueField(wireName: r'lang')
    String get lang;

    @BuiltValueField(wireName: r'context')
    BuiltMap<String, JsonObject> get context;

    // Boilerplate code needed to wire-up generated code
    InteractRequest._();

    static void _initializeBuilder(InteractRequestBuilder b) => b;

    factory InteractRequest([void updates(InteractRequestBuilder b)]) = _$InteractRequest;
    static Serializer<InteractRequest> get serializer => _$interactRequestSerializer;
}

