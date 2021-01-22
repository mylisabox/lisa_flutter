//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
// ignore_for_file: unused_import

import 'package:lisa_server_sdk/model/scene_data.dart';

part 'scene.g.dart';

abstract class Scene implements Built<Scene, SceneBuilder> {

    @BuiltValueField(wireName: r'name')
    String get name;

    @BuiltValueField(wireName: r'displayName')
    String get displayName;

    @BuiltValueField(wireName: r'data')
    SceneData get data;

    // Boilerplate code needed to wire-up generated code
    Scene._();

    static void _initializeBuilder(SceneBuilder b) => b;

    factory Scene([void updates(SceneBuilder b)]) = _$Scene;
    static Serializer<Scene> get serializer => _$sceneSerializer;
}

