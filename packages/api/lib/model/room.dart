//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'room.g.dart';

abstract class Room implements Built<Room, RoomBuilder> {

    @nullable
    @BuiltValueField(wireName: r'id')
    int get id;

    @BuiltValueField(wireName: r'name')
    String get name;

    // Boilerplate code needed to wire-up generated code
    Room._();

    static void _initializeBuilder(RoomBuilder b) => b;

    factory Room([void updates(RoomBuilder b)]) = _$Room;
    static Serializer<Room> get serializer => _$roomSerializer;
}

