//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';

part 'device_settings.g.dart';

/// DeviceSettings
///
/// Properties:
/// * [name]
/// * [driver]
/// * [image]
/// * [imageOn]
/// * [imageOff]
/// * [defaultAction]
/// * [pairing]
/// * [pluginName]
/// * [description]
/// * [type]
/// * [template]
/// * [settings]
abstract class DeviceSettings implements Built<DeviceSettings, DeviceSettingsBuilder> {
    @BuiltValueField(wireName: r'name')
    String get name;

    @BuiltValueField(wireName: r'driver')
    String get driver;

    @BuiltValueField(wireName: r'image')
    String get image;

    @BuiltValueField(wireName: r'imageOn')
    String? get imageOn;

    @BuiltValueField(wireName: r'imageOff')
    String? get imageOff;

    @BuiltValueField(wireName: r'defaultAction')
    String? get defaultAction;

    @BuiltValueField(wireName: r'pairing')
    String get pairing;

    @BuiltValueField(wireName: r'pluginName')
    String get pluginName;

    @BuiltValueField(wireName: r'description')
    String? get description;

    @BuiltValueField(wireName: r'type')
    String? get type;

    @BuiltValueField(wireName: r'template')
    BuiltMap<String, JsonObject> get template;

    @BuiltValueField(wireName: r'settings')
    BuiltMap<String, JsonObject>? get settings;

    DeviceSettings._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(DeviceSettingsBuilder b) => b;

    factory DeviceSettings([void updates(DeviceSettingsBuilder b)]) = _$DeviceSettings;

    @BuiltValueSerializer(custom: true)
    static Serializer<DeviceSettings> get serializer => _$DeviceSettingsSerializer();
}

class _$DeviceSettingsSerializer implements StructuredSerializer<DeviceSettings> {
    @override
    final Iterable<Type> types = const [DeviceSettings, _$DeviceSettings];

    @override
    final String wireName = r'DeviceSettings';

    @override
    Iterable<Object?> serialize(Serializers serializers, DeviceSettings object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'name')
            ..add(serializers.serialize(object.name,
                specifiedType: const FullType(String)));
        result
            ..add(r'driver')
            ..add(serializers.serialize(object.driver,
                specifiedType: const FullType(String)));
        result
            ..add(r'image')
            ..add(serializers.serialize(object.image,
                specifiedType: const FullType(String)));
        if (object.imageOn != null) {
            result
                ..add(r'imageOn')
                ..add(serializers.serialize(object.imageOn,
                    specifiedType: const FullType(String)));
        }
        if (object.imageOff != null) {
            result
                ..add(r'imageOff')
                ..add(serializers.serialize(object.imageOff,
                    specifiedType: const FullType(String)));
        }
        if (object.defaultAction != null) {
            result
                ..add(r'defaultAction')
                ..add(serializers.serialize(object.defaultAction,
                    specifiedType: const FullType(String)));
        }
        result
            ..add(r'pairing')
            ..add(serializers.serialize(object.pairing,
                specifiedType: const FullType(String)));
        result
            ..add(r'pluginName')
            ..add(serializers.serialize(object.pluginName,
                specifiedType: const FullType(String)));
        if (object.description != null) {
            result
                ..add(r'description')
                ..add(serializers.serialize(object.description,
                    specifiedType: const FullType(String)));
        }
        if (object.type != null) {
            result
                ..add(r'type')
                ..add(serializers.serialize(object.type,
                    specifiedType: const FullType(String)));
        }
        result
            ..add(r'template')
            ..add(serializers.serialize(object.template,
                specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)])));
        if (object.settings != null) {
            result
                ..add(r'settings')
                ..add(serializers.serialize(object.settings,
                    specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)])));
        }
        return result;
    }

    @override
    DeviceSettings deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = DeviceSettingsBuilder();

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
                case r'driver':
                    result.driver = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'image':
                    result.image = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'imageOn':
                    result.imageOn = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'imageOff':
                    result.imageOff = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'defaultAction':
                    result.defaultAction = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'pairing':
                    result.pairing = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'pluginName':
                    result.pluginName = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'description':
                    result.description = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'type':
                    result.type = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'template':
                    result.template.replace(serializers.deserialize(value,
                        specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)])) as BuiltMap<String, JsonObject>);
                    break;
                case r'settings':
                    result.settings.replace(serializers.deserialize(value,
                        specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)])) as BuiltMap<String, JsonObject>);
                    break;
            }
        }
        return result.build();
    }
}

