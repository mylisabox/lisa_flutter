// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_plugin.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$StorePluginSerializer implements Serializer<StorePlugin> {
  @override
  Map<String, dynamic> toMap(StorePlugin model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(ret, 'id', model.id);
    setMapValueIfNotNull(ret, 'name', model.name);
    setMapValueIfNotNull(ret, 'description', model.description);
    setMapValueIfNotNull(ret, 'installed', model.installed);
    return ret;
  }

  @override
  StorePlugin fromMap(Map map) {
    if (map == null) return null;
    final obj = StorePlugin(
        id: map['id'] as String ?? getJserDefault('id'),
        name: map['name'] as String ?? getJserDefault('name'),
        description:
            map['description'] as String ?? getJserDefault('description'),
        installed: map['installed'] as bool ?? getJserDefault('installed'));
    return obj;
  }
}
