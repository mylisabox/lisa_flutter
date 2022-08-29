//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'is_initialized.g.dart';

/// IsInitialized
///
/// Properties:
/// * [initialized] 
abstract class IsInitialized implements Built<IsInitialized, IsInitializedBuilder> {
    @BuiltValueField(wireName: r'initialized')
    bool get initialized;

    IsInitialized._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(IsInitializedBuilder b) => b;

    factory IsInitialized([void updates(IsInitializedBuilder b)]) = _$IsInitialized;

    @BuiltValueSerializer(custom: true)
    static Serializer<IsInitialized> get serializer => _$IsInitializedSerializer();
}

class _$IsInitializedSerializer implements StructuredSerializer<IsInitialized> {
    @override
    final Iterable<Type> types = const [IsInitialized, _$IsInitialized];

    @override
    final String wireName = r'IsInitialized';

    @override
    Iterable<Object?> serialize(Serializers serializers, IsInitialized object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'initialized')
            ..add(serializers.serialize(object.initialized,
                specifiedType: const FullType(bool)));
        return result;
    }

    @override
    IsInitialized deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = IsInitializedBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            switch (key) {
                case r'initialized':
                    result.initialized = serializers.deserialize(value,
                        specifiedType: const FullType(bool)) as bool;
                    break;
            }
        }
        return result.build();
    }
}

