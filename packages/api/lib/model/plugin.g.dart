// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'plugin.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Plugin> _$pluginSerializer = new _$PluginSerializer();

class _$PluginSerializer implements StructuredSerializer<Plugin> {
  @override
  final Iterable<Type> types = const [Plugin, _$Plugin];
  @override
  final String wireName = 'Plugin';

  @override
  Iterable<Object> serialize(Serializers serializers, Plugin object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'devicesSettings',
      serializers.serialize(object.devicesSettings,
          specifiedType: const FullType(
              BuiltList, const [const FullType(DeviceSettings)])),
    ];
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.image != null) {
      result
        ..add('image')
        ..add(serializers.serialize(object.image,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Plugin deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PluginBuilder();

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
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'devicesSettings':
          result.devicesSettings.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DeviceSettings)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$Plugin extends Plugin {
  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String image;
  @override
  final BuiltList<DeviceSettings> devicesSettings;

  factory _$Plugin([void Function(PluginBuilder) updates]) =>
      (new PluginBuilder()..update(updates)).build();

  _$Plugin._(
      {this.id, this.name, this.description, this.image, this.devicesSettings})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Plugin', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Plugin', 'name');
    }
    if (devicesSettings == null) {
      throw new BuiltValueNullFieldError('Plugin', 'devicesSettings');
    }
  }

  @override
  Plugin rebuild(void Function(PluginBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PluginBuilder toBuilder() => new PluginBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Plugin &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        image == other.image &&
        devicesSettings == other.devicesSettings;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), name.hashCode), description.hashCode),
            image.hashCode),
        devicesSettings.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Plugin')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('image', image)
          ..add('devicesSettings', devicesSettings))
        .toString();
  }
}

class PluginBuilder implements Builder<Plugin, PluginBuilder> {
  _$Plugin _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _image;
  String get image => _$this._image;
  set image(String image) => _$this._image = image;

  ListBuilder<DeviceSettings> _devicesSettings;
  ListBuilder<DeviceSettings> get devicesSettings =>
      _$this._devicesSettings ??= new ListBuilder<DeviceSettings>();
  set devicesSettings(ListBuilder<DeviceSettings> devicesSettings) =>
      _$this._devicesSettings = devicesSettings;

  PluginBuilder() {
    Plugin._initializeBuilder(this);
  }

  PluginBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _description = _$v.description;
      _image = _$v.image;
      _devicesSettings = _$v.devicesSettings?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Plugin other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Plugin;
  }

  @override
  void update(void Function(PluginBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Plugin build() {
    _$Plugin _$result;
    try {
      _$result = _$v ??
          new _$Plugin._(
              id: id,
              name: name,
              description: description,
              image: image,
              devicesSettings: devicesSettings.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'devicesSettings';
        devicesSettings.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Plugin', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
