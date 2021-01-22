// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'dashboard.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Dashboard> _$dashboardSerializer = new _$DashboardSerializer();

class _$DashboardSerializer implements StructuredSerializer<Dashboard> {
  @override
  final Iterable<Type> types = const [Dashboard, _$Dashboard];
  @override
  final String wireName = 'Dashboard';

  @override
  Iterable<Object> serialize(Serializers serializers, Dashboard object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'userId',
      serializers.serialize(object.userId, specifiedType: const FullType(int)),
      'widgets',
      serializers.serialize(object.widgets,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Device)])),
    ];
    if (object.roomId != null) {
      result
        ..add('roomId')
        ..add(serializers.serialize(object.roomId,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Dashboard deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DashboardBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'roomId':
          result.roomId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'widgets':
          result.widgets.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Device)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$Dashboard extends Dashboard {
  @override
  final int id;
  @override
  final int roomId;
  @override
  final int userId;
  @override
  final BuiltList<Device> widgets;

  factory _$Dashboard([void Function(DashboardBuilder) updates]) =>
      (new DashboardBuilder()..update(updates)).build();

  _$Dashboard._({this.id, this.roomId, this.userId, this.widgets}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Dashboard', 'id');
    }
    if (userId == null) {
      throw new BuiltValueNullFieldError('Dashboard', 'userId');
    }
    if (widgets == null) {
      throw new BuiltValueNullFieldError('Dashboard', 'widgets');
    }
  }

  @override
  Dashboard rebuild(void Function(DashboardBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DashboardBuilder toBuilder() => new DashboardBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Dashboard &&
        id == other.id &&
        roomId == other.roomId &&
        userId == other.userId &&
        widgets == other.widgets;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), roomId.hashCode), userId.hashCode),
        widgets.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Dashboard')
          ..add('id', id)
          ..add('roomId', roomId)
          ..add('userId', userId)
          ..add('widgets', widgets))
        .toString();
  }
}

class DashboardBuilder implements Builder<Dashboard, DashboardBuilder> {
  _$Dashboard _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  int _roomId;
  int get roomId => _$this._roomId;
  set roomId(int roomId) => _$this._roomId = roomId;

  int _userId;
  int get userId => _$this._userId;
  set userId(int userId) => _$this._userId = userId;

  ListBuilder<Device> _widgets;
  ListBuilder<Device> get widgets =>
      _$this._widgets ??= new ListBuilder<Device>();
  set widgets(ListBuilder<Device> widgets) => _$this._widgets = widgets;

  DashboardBuilder() {
    Dashboard._initializeBuilder(this);
  }

  DashboardBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _roomId = _$v.roomId;
      _userId = _$v.userId;
      _widgets = _$v.widgets?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Dashboard other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Dashboard;
  }

  @override
  void update(void Function(DashboardBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Dashboard build() {
    _$Dashboard _$result;
    try {
      _$result = _$v ??
          new _$Dashboard._(
              id: id, roomId: roomId, userId: userId, widgets: widgets.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'widgets';
        widgets.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Dashboard', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
