//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:lisa_server_sdk/src/model/device.dart';

part 'dashboard.g.dart';

/// Dashboard
///
/// Properties:
/// * [id]
/// * [roomId]
/// * [userId]
/// * [widgets]
abstract class Dashboard implements Built<Dashboard, DashboardBuilder> {
    @BuiltValueField(wireName: r'id')
    int get id;

    @BuiltValueField(wireName: r'roomId')
    int? get roomId;

    @BuiltValueField(wireName: r'userId')
    int get userId;

    @BuiltValueField(wireName: r'widgets')
    BuiltList<Device> get widgets;

    Dashboard._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(DashboardBuilder b) => b;

    factory Dashboard([void updates(DashboardBuilder b)]) = _$Dashboard;

    @BuiltValueSerializer(custom: true)
    static Serializer<Dashboard> get serializer => _$DashboardSerializer();
}

class _$DashboardSerializer implements StructuredSerializer<Dashboard> {
    @override
    final Iterable<Type> types = const [Dashboard, _$Dashboard];

    @override
    final String wireName = r'Dashboard';

    @override
    Iterable<Object?> serialize(Serializers serializers, Dashboard object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'id')
            ..add(serializers.serialize(object.id,
                specifiedType: const FullType(int)));
        result
            ..add(r'roomId')
            ..add(object.roomId == null ? null : serializers.serialize(object.roomId,
                specifiedType: const FullType(int)));
        result
            ..add(r'userId')
            ..add(serializers.serialize(object.userId,
                specifiedType: const FullType(int)));
        result
            ..add(r'widgets')
            ..add(serializers.serialize(object.widgets,
                specifiedType: const FullType(BuiltList, [FullType(Device)])));
        return result;
    }

    @override
    Dashboard deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = DashboardBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            switch (key) {
                case r'id':
                    result.id = serializers.deserialize(value,
                        specifiedType: const FullType(int)) as int;
                    break;
                case r'roomId':
                    result.roomId = serializers.deserialize(value,
                        specifiedType: const FullType(int)) as int;
                    break;
                case r'userId':
                    result.userId = serializers.deserialize(value,
                        specifiedType: const FullType(int)) as int;
                    break;
                case r'widgets':
                    result.widgets.replace(serializers.deserialize(value,
                        specifiedType: const FullType(BuiltList, [FullType(Device)])) as BuiltList<Device>);
                    break;
            }
        }
        return result.build();
    }
}

