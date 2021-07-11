//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

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

    StorePlugin._();

    static void _initializeBuilder(StorePluginBuilder b) => b;

    factory StorePlugin([void updates(StorePluginBuilder b)]) = _$StorePlugin;

    @BuiltValueSerializer(custom: true)
    static Serializer<StorePlugin> get serializer => _$StorePluginSerializer();
}

class _$StorePluginSerializer implements StructuredSerializer<StorePlugin> {
    @override
    final Iterable<Type> types = const [StorePlugin, _$StorePlugin];

    @override
    final String wireName = r'StorePlugin';

    @override
    Iterable<Object?> serialize(Serializers serializers, StorePlugin object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'id')
            ..add(serializers.serialize(object.id,
                specifiedType: const FullType(String)));
        result
            ..add(r'name')
            ..add(serializers.serialize(object.name,
                specifiedType: const FullType(String)));
        result
            ..add(r'description')
            ..add(serializers.serialize(object.description,
                specifiedType: const FullType(String)));
        result
            ..add(r'installed')
            ..add(serializers.serialize(object.installed,
                specifiedType: const FullType(bool)));
        return result;
    }

    @override
    StorePlugin deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = StorePluginBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            switch (key) {
                case r'id':
                    result.id = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'name':
                    result.name = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'description':
                    result.description = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'installed':
                    result.installed = serializers.deserialize(value,
                        specifiedType: const FullType(bool)) as bool;
                    break;
            }
        }
        return result.build();
    }
}

