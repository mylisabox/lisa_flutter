//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'interact_response.g.dart';

abstract class InteractResponse implements Built<InteractResponse, InteractResponseBuilder> {

    @BuiltValueField(wireName: r'action')
    String get action;

    @BuiltValueField(wireName: r'lang')
    String get lang;

    @BuiltValueField(wireName: r'userId')
    int get userId;

    @BuiltValueField(wireName: r'userSentence')
    String get userSentence;

    @BuiltValueField(wireName: r'response')
    String get response;

    @BuiltValueField(wireName: r'responses')
    BuiltList<String> get responses;

    // Boilerplate code needed to wire-up generated code
    InteractResponse._();

    static void _initializeBuilder(InteractResponseBuilder b) => b;

    factory InteractResponse([void updates(InteractResponseBuilder b)]) = _$InteractResponse;
    static Serializer<InteractResponse> get serializer => _$interactResponseSerializer;
}

