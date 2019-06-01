// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$RoomSerializer implements Serializer<Room> {
  @override
  Map<String, dynamic> toMap(Room model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(ret, 'id', model.id);
    setMapValueIfNotNull(ret, 'name', model.name);
    return ret;
  }

  @override
  Room fromMap(Map map) {
    if (map == null) return null;
    final obj = new Room(
        id: map['id'] as int ?? getJserDefault('id'),
        name: map['name'] as String ?? getJserDefault('name'));
    return obj;
  }
}
