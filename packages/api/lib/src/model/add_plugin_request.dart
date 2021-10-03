//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'add_plugin_request.g.dart';

/// AddPluginRequest
///
/// Properties:
/// * [id] 
/// * [version] 
/// * [from] 
abstract class AddPluginRequest implements Built<AddPluginRequest, AddPluginRequestBuilder> {
    @BuiltValueField(wireName: r'id')
    String? get id;

    @BuiltValueField(wireName: r'version')
    String? get version;

    @BuiltValueField(wireName: r'from')
    String? get from;

    AddPluginRequest._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(AddPluginRequestBuilder b) => b;

    factory AddPluginRequest([void updates(AddPluginRequestBuilder b)]) = _$AddPluginRequest;

    @BuiltValueSerializer(custom: true)
    static Serializer<AddPluginRequest> get serializer => _$AddPluginRequestSerializer();
}

class _$AddPluginRequestSerializer implements StructuredSerializer<AddPluginRequest> {
    @override
    final Iterable<Type> types = const [AddPluginRequest, _$AddPluginRequest];

    @override
    final String wireName = r'AddPluginRequest';

    @override
    Iterable<Object?> serialize(Serializers serializers, AddPluginRequest object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        if (object.id != null) {
            result
                ..add(r'id')
                ..add(serializers.serialize(object.id,
                    specifiedType: const FullType(String)));
        }
        if (object.version != null) {
            result
                ..add(r'version')
                ..add(serializers.serialize(object.version,
                    specifiedType: const FullType(String)));
        }
        if (object.from != null) {
            result
                ..add(r'from')
                ..add(serializers.serialize(object.from,
                    specifiedType: const FullType(String)));
        }
        return result;
    }

    @override
    AddPluginRequest deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = AddPluginRequestBuilder();

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
                case r'version':
                    result.version = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'from':
                    result.from = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
            }
        }
        return result.build();
    }
}

