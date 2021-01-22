//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'scene_data.g.dart';

abstract class SceneData implements Built<SceneData, SceneDataBuilder> {

    @BuiltValueField(wireName: r'sentences')
    BuiltList<String> get sentences;

    @BuiltValueField(wireName: r'responses')
    BuiltList<String> get responses;

    @BuiltValueField(wireName: r'commands')
    BuiltList<String> get commands;

    // Boilerplate code needed to wire-up generated code
    SceneData._();

    static void _initializeBuilder(SceneDataBuilder b) => b;

    factory SceneData([void updates(SceneDataBuilder b)]) = _$SceneData;
    static Serializer<SceneData> get serializer => _$sceneDataSerializer;
}

