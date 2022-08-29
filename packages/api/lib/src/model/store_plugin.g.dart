// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_plugin.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StorePlugin extends StorePlugin {
  @override
  final String id;
  @override
  final String name;
  @override
  final String? image;
  @override
  final String description;
  @override
  final bool installed;

  factory _$StorePlugin([void Function(StorePluginBuilder)? updates]) =>
      (new StorePluginBuilder()..update(updates)).build();

  _$StorePlugin._(
      {required this.id,
      required this.name,
      this.image,
      required this.description,
      required this.installed})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'StorePlugin', 'id');
    BuiltValueNullFieldError.checkNotNull(name, 'StorePlugin', 'name');
    BuiltValueNullFieldError.checkNotNull(
        description, 'StorePlugin', 'description');
    BuiltValueNullFieldError.checkNotNull(
        installed, 'StorePlugin', 'installed');
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
        image == other.image &&
        description == other.description &&
        installed == other.installed;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), name.hashCode), image.hashCode),
            description.hashCode),
        installed.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('StorePlugin')
          ..add('id', id)
          ..add('name', name)
          ..add('image', image)
          ..add('description', description)
          ..add('installed', installed))
        .toString();
  }
}

class StorePluginBuilder implements Builder<StorePlugin, StorePluginBuilder> {
  _$StorePlugin? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  bool? _installed;
  bool? get installed => _$this._installed;
  set installed(bool? installed) => _$this._installed = installed;

  StorePluginBuilder() {
    StorePlugin._defaults(this);
  }

  StorePluginBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _image = $v.image;
      _description = $v.description;
      _installed = $v.installed;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StorePlugin other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StorePlugin;
  }

  @override
  void update(void Function(StorePluginBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StorePlugin build() {
    final _$result = _$v ??
        new _$StorePlugin._(
            id: BuiltValueNullFieldError.checkNotNull(id, 'StorePlugin', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, 'StorePlugin', 'name'),
            image: image,
            description: BuiltValueNullFieldError.checkNotNull(
                description, 'StorePlugin', 'description'),
            installed: BuiltValueNullFieldError.checkNotNull(
                installed, 'StorePlugin', 'installed'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
