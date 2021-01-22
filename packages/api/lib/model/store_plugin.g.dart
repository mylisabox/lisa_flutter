// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'store_plugin.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StorePlugin> _$storePluginSerializer = new _$StorePluginSerializer();

class _$StorePluginSerializer implements StructuredSerializer<StorePlugin> {
  @override
  final Iterable<Type> types = const [StorePlugin, _$StorePlugin];
  @override
  final String wireName = 'StorePlugin';

  @override
  Iterable<Object> serialize(Serializers serializers, StorePlugin object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'installed',
      serializers.serialize(object.installed,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  StorePlugin deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StorePluginBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'installed':
          result.installed = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$StorePlugin extends StorePlugin {
  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final bool installed;

  factory _$StorePlugin([void Function(StorePluginBuilder) updates]) =>
      (new StorePluginBuilder()..update(updates)).build();

  _$StorePlugin._({this.id, this.name, this.description, this.installed})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('StorePlugin', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('StorePlugin', 'name');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('StorePlugin', 'description');
    }
    if (installed == null) {
      throw new BuiltValueNullFieldError('StorePlugin', 'installed');
    }
  }

  @override
  StorePlugin rebuild(void Function(StorePluginBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StorePluginBuilder toBuilder() => new StorePluginBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StorePlugin &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        installed == other.installed;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), name.hashCode), description.hashCode),
        installed.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('StorePlugin')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('installed', installed))
        .toString();
  }
}

class StorePluginBuilder implements Builder<StorePlugin, StorePluginBuilder> {
  _$StorePlugin _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  bool _installed;
  bool get installed => _$this._installed;
  set installed(bool installed) => _$this._installed = installed;

  StorePluginBuilder() {
    StorePlugin._initializeBuilder(this);
  }

  StorePluginBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _description = _$v.description;
      _installed = _$v.installed;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StorePlugin other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$StorePlugin;
  }

  @override
  void update(void Function(StorePluginBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StorePlugin build() {
    final _$result = _$v ??
        new _$StorePlugin._(
            id: id, name: name, description: description, installed: installed);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
