//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_device_info_request.g.dart';

/// UpdateDeviceInfoRequest
///
/// Properties:
/// * [name] 
/// * [roomId] 
abstract class UpdateDeviceInfoRequest implements Built<UpdateDeviceInfoRequest, UpdateDeviceInfoRequestBuilder> {
    @BuiltValueField(wireName: r'name')
    String get name;

    @BuiltValueField(wireName: r'roomId')
    int? get roomId;

    UpdateDeviceInfoRequest._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(UpdateDeviceInfoRequestBuilder b) => b;

    factory UpdateDeviceInfoRequest([void updates(UpdateDeviceInfoRequestBuilder b)]) = _$UpdateDeviceInfoRequest;

    @BuiltValueSerializer(custom: true)
    static Serializer<UpdateDeviceInfoRequest> get serializer => _$UpdateDeviceInfoRequestSerializer();
}

class _$UpdateDeviceInfoRequestSerializer implements StructuredSerializer<UpdateDeviceInfoRequest> {
    @override
    final Iterable<Type> types = const [UpdateDeviceInfoRequest, _$UpdateDeviceInfoRequest];

    @override
    final String wireName = r'UpdateDeviceInfoRequest';

    @override
    Iterable<Object?> serialize(Serializers serializers, UpdateDeviceInfoRequest object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'name')
            ..add(serializers.serialize(object.name,
                specifiedType: const FullType(String)));
        if (object.roomId != null) {
            result
                ..add(r'roomId')
                ..add(serializers.serialize(object.roomId,
                    specifiedType: const FullType(int)));
        }
        return result;
    }

    @override
    UpdateDeviceInfoRequest deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = UpdateDeviceInfoRequestBuilder();

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
                case r'roomId':
                    result.roomId = serializers.deserialize(value,
                        specifiedType: const FullType(int)) as int;
                    break;
            }
        }
        return result.build();
    }
}

