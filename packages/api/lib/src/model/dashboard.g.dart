// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Dashboard extends Dashboard {
  @override
  final int id;
  @override
  final int? roomId;
  @override
  final int userId;
  @override
  final BuiltList<Device> widgets;

  factory _$Dashboard([void Function(DashboardBuilder)? updates]) =>
      (new DashboardBuilder()..update(updates)).build();

  _$Dashboard._(
      {required this.id,
      this.roomId,
      required this.userId,
      required this.widgets})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'Dashboard', 'id');
    BuiltValueNullFieldError.checkNotNull(userId, 'Dashboard', 'userId');
    BuiltValueNullFieldError.checkNotNull(widgets, 'Dashboard', 'widgets');
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
  _$Dashboard? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _roomId;
  int? get roomId => _$this._roomId;
  set roomId(int? roomId) => _$this._roomId = roomId;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  ListBuilder<Device>? _widgets;
  ListBuilder<Device> get widgets =>
      _$this._widgets ??= new ListBuilder<Device>();
  set widgets(ListBuilder<Device>? widgets) => _$this._widgets = widgets;

  DashboardBuilder() {
    Dashboard._initializeBuilder(this);
  }

  DashboardBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _roomId = $v.roomId;
      _userId = $v.userId;
      _widgets = $v.widgets.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Dashboard other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Dashboard;
  }

  @override
  void update(void Function(DashboardBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Dashboard build() {
    _$Dashboard _$result;
    try {
      _$result = _$v ??
          new _$Dashboard._(
              id: BuiltValueNullFieldError.checkNotNull(id, 'Dashboard', 'id'),
              roomId: roomId,
              userId: BuiltValueNullFieldError.checkNotNull(
                  userId, 'Dashboard', 'userId'),
              widgets: widgets.build());
    } catch (_) {
      late String _$failedField;
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
