//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:lisa_server_sdk/src/model/device_settings.dart';

part 'plugin.g.dart';

/// Plugin
///
/// Properties:
/// * [id]
/// * [name]
/// * [description]
/// * [image]
/// * [devicesSettings]
abstract class Plugin implements Built<Plugin, PluginBuilder> {
    @BuiltValueField(wireName: r'id')
    String get id;

    @BuiltValueField(wireName: r'name')
    String get name;

    @BuiltValueField(wireName: r'description')
    String? get description;

    @BuiltValueField(wireName: r'image')
    String? get image;

    @BuiltValueField(wireName: r'devicesSettings')
    BuiltList<DeviceSettings>? get devicesSettings;

    Plugin._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(PluginBuilder b) => b;

    factory Plugin([void updates(PluginBuilder b)]) = _$Plugin;

    @BuiltValueSerializer(custom: true)
    static Serializer<Plugin> get serializer => _$PluginSerializer();
}

class _$PluginSerializer implements StructuredSerializer<Plugin> {
    @override
    final Iterable<Type> types = const [Plugin, _$Plugin];

    @override
    final String wireName = r'Plugin';

    @override
    Iterable<Object?> serialize(Serializers serializers, Plugin object,
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
            ..add(object.description == null ? null : serializers.serialize(object.description,
                specifiedType: const FullType(String)));
        if (object.image != null) {
            result
                ..add(r'image')
                ..add(serializers.serialize(object.image,
                    specifiedType: const FullType(String)));
        }
        if (object.devicesSettings != null) {
            result
                ..add(r'devicesSettings')
                ..add(serializers.serialize(object.devicesSettings,
                    specifiedType: const FullType(BuiltList, [FullType(DeviceSettings)])));
        }
        return result;
    }

    @override
    Plugin deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = PluginBuilder();

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
                case r'image':
                    result.image = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'devicesSettings':
                    result.devicesSettings.replace(serializers.deserialize(value,
                        specifiedType: const FullType(BuiltList, [FullType(DeviceSettings)])) as BuiltList<DeviceSettings>);
                    break;
            }
        }
        return result.build();
    }
}

