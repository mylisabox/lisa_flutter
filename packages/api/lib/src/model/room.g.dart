// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Room extends Room {
  @override
  final int? id;
  @override
  final String name;

  factory _$Room([void Function(RoomBuilder)? updates]) =>
      (new RoomBuilder()..update(updates)).build();

  _$Room._({this.id, required this.name}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, 'Room', 'name');
  }

  @override
  Room rebuild(void Function(RoomBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RoomBuilder toBuilder() => new RoomBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Room && id == other.id && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Room')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class RoomBuilder implements Builder<Room, RoomBuilder> {
  _$Room? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  RoomBuilder() {
    Room._initializeBuilder(this);
  }

  RoomBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Room other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Room;
  }

  @override
  void update(void Function(RoomBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Room build() {
    final _$result = _$v ??
        new _$Room._(
            id: id,
            name: BuiltValueNullFieldError.checkNotNull(name, 'Room', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
