// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scene.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Scene extends Scene {
  @override
  final String name;
  @override
  final String displayName;
  @override
  final SceneData data;

  factory _$Scene([void Function(SceneBuilder)? updates]) =>
      (new SceneBuilder()..update(updates)).build();

  _$Scene._({required this.name, required this.displayName, required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, 'Scene', 'name');
    BuiltValueNullFieldError.checkNotNull(displayName, 'Scene', 'displayName');
    BuiltValueNullFieldError.checkNotNull(data, 'Scene', 'data');
  }

  @override
  Scene rebuild(void Function(SceneBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SceneBuilder toBuilder() => new SceneBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Scene &&
        name == other.name &&
        displayName == other.displayName &&
        data == other.data;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, name.hashCode), displayName.hashCode), data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Scene')
          ..add('name', name)
          ..add('displayName', displayName)
          ..add('data', data))
        .toString();
  }
}

class SceneBuilder implements Builder<Scene, SceneBuilder> {
  _$Scene? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  SceneDataBuilder? _data;
  SceneDataBuilder get data => _$this._data ??= new SceneDataBuilder();
  set data(SceneDataBuilder? data) => _$this._data = data;

  SceneBuilder() {
    Scene._initializeBuilder(this);
  }

  SceneBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _displayName = $v.displayName;
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Scene other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Scene;
  }

  @override
  void update(void Function(SceneBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Scene build() {
    _$Scene _$result;
    try {
      _$result = _$v ??
          new _$Scene._(
              name:
                  BuiltValueNullFieldError.checkNotNull(name, 'Scene', 'name'),
              displayName: BuiltValueNullFieldError.checkNotNull(
                  displayName, 'Scene', 'displayName'),
              data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Scene', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
