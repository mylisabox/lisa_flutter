// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'scene.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Scene> _$sceneSerializer = new _$SceneSerializer();

class _$SceneSerializer implements StructuredSerializer<Scene> {
  @override
  final Iterable<Type> types = const [Scene, _$Scene];
  @override
  final String wireName = 'Scene';

  @override
  Iterable<Object> serialize(Serializers serializers, Scene object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(SceneData)),
    ];

    return result;
  }

  @override
  Scene deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SceneBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(SceneData)) as SceneData);
          break;
      }
    }

    return result.build();
  }
}

class _$Scene extends Scene {
  @override
  final String name;
  @override
  final String displayName;
  @override
  final SceneData data;

  factory _$Scene([void Function(SceneBuilder) updates]) =>
      (new SceneBuilder()..update(updates)).build();

  _$Scene._({this.name, this.displayName, this.data}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('Scene', 'name');
    }
    if (displayName == null) {
      throw new BuiltValueNullFieldError('Scene', 'displayName');
    }
    if (data == null) {
      throw new BuiltValueNullFieldError('Scene', 'data');
    }
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
  _$Scene _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  SceneDataBuilder _data;
  SceneDataBuilder get data => _$this._data ??= new SceneDataBuilder();
  set data(SceneDataBuilder data) => _$this._data = data;

  SceneBuilder() {
    Scene._initializeBuilder(this);
  }

  SceneBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _displayName = _$v.displayName;
      _data = _$v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Scene other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Scene;
  }

  @override
  void update(void Function(SceneBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Scene build() {
    _$Scene _$result;
    try {
      _$result = _$v ??
          new _$Scene._(
              name: name, displayName: displayName, data: data.build());
    } catch (_) {
      String _$failedField;
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
