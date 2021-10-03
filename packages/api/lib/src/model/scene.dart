//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:lisa_server_sdk/src/model/scene_data.dart';

part 'scene.g.dart';

/// Scene
///
/// Properties:
/// * [name]
/// * [displayName]
/// * [data]
abstract class Scene implements Built<Scene, SceneBuilder> {
    @BuiltValueField(wireName: r'name')
    String get name;

    @BuiltValueField(wireName: r'displayName')
    String get displayName;

    @BuiltValueField(wireName: r'data')
    SceneData get data;

    Scene._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(SceneBuilder b) => b;

    factory Scene([void updates(SceneBuilder b)]) = _$Scene;

    @BuiltValueSerializer(custom: true)
    static Serializer<Scene> get serializer => _$SceneSerializer();
}

class _$SceneSerializer implements StructuredSerializer<Scene> {
    @override
    final Iterable<Type> types = const [Scene, _$Scene];

    @override
    final String wireName = r'Scene';

    @override
    Iterable<Object?> serialize(Serializers serializers, Scene object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'name')
            ..add(serializers.serialize(object.name,
                specifiedType: const FullType(String)));
        result
            ..add(r'displayName')
            ..add(serializers.serialize(object.displayName,
                specifiedType: const FullType(String)));
        result
            ..add(r'data')
            ..add(serializers.serialize(object.data,
                specifiedType: const FullType(SceneData)));
        return result;
    }

    @override
    Scene deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = SceneBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            switch (key) {
                case r'name':
                    result.name = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'displayName':
                    result.displayName = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'data':
                    result.data.replace(serializers.deserialize(value,
                        specifiedType: const FullType(SceneData)) as SceneData);
                    break;
            }
        }
        return result.build();
    }
}

