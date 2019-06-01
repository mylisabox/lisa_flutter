// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plugin.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$PluginSerializer implements Serializer<Plugin> {
  Serializer<DeviceSettings> __deviceSettingsSerializer;
  Serializer<DeviceSettings> get _deviceSettingsSerializer =>
      __deviceSettingsSerializer ??= new DeviceSettingsSerializer();
  @override
  Map<String, dynamic> toMap(Plugin model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(ret, 'id', model.id);
    setMapValueIfNotNull(ret, 'name', model.name);
    setMapValueIfNotNull(ret, 'description', model.description);
    setMapValueIfNotNull(ret, 'image', model.image);
    setMapValueIfNotNull(ret, 'devicesSettings',
        _deviceSettingsSerializer.toMap(model.devicesSettings));
    return ret;
  }

  @override
  Plugin fromMap(Map map) {
    if (map == null) return null;
    final obj = new Plugin(
        id: map['id'] as String ?? getJserDefault('id'),
        name: map['name'] as String ?? getJserDefault('name'),
        description:
            map['description'] as String ?? getJserDefault('description'),
        image: map['image'] as String ?? getJserDefault('image'),
        devicesSettings:
            _deviceSettingsSerializer.fromMap(map['devicesSettings'] as Map) ??
                getJserDefault('devicesSettings'));
    return obj;
  }
}
