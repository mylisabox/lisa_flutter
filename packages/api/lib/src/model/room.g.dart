// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Room extends Room {
  @override
  final int? id;
  @override
  final int sortOrder;
  @override
  final String name;
  @override
  final BuiltList<Device> devices;

  factory _$Room([void Function(RoomBuilder)? updates]) =>
      (new RoomBuilder()..update(updates)).build();

  _$Room._(
      {this.id,
      required this.sortOrder,
      required this.name,
      required this.devices})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(sortOrder, 'Room', 'sortOrder');
    BuiltValueNullFieldError.checkNotNull(name, 'Room', 'name');
    BuiltValueNullFieldError.checkNotNull(devices, 'Room', 'devices');
  }

  @override
  Room rebuild(void Function(RoomBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RoomBuilder toBuilder() => new RoomBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Room &&
        id == other.id &&
        sortOrder == other.sortOrder &&
        name == other.name &&
        devices == other.devices;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), sortOrder.hashCode), name.hashCode),
        devices.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Room')
          ..add('id', id)
          ..add('sortOrder', sortOrder)
          ..add('name', name)
          ..add('devices', devices))
        .toString();
  }
}

class RoomBuilder implements Builder<Room, RoomBuilder> {
  _$Room? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _sortOrder;
  int? get sortOrder => _$this._sortOrder;
  set sortOrder(int? sortOrder) => _$this._sortOrder = sortOrder;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<Device>? _devices;
  ListBuilder<Device> get devices =>
      _$this._devices ??= new ListBuilder<Device>();
  set devices(ListBuilder<Device>? devices) => _$this._devices = devices;

  RoomBuilder() {
    Room._defaults(this);
  }

  RoomBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _sortOrder = $v.sortOrder;
      _name = $v.name;
      _devices = $v.devices.toBuilder();
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
    _$Room _$result;
    try {
      _$result = _$v ??
          new _$Room._(
              id: id,
              sortOrder: BuiltValueNullFieldError.checkNotNull(
                  sortOrder, 'Room', 'sortOrder'),
              name: BuiltValueNullFieldError.checkNotNull(name, 'Room', 'name'),
              devices: devices.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'devices';
        devices.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Room', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
