// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'add_plugin_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AddPluginRequest> _$addPluginRequestSerializer =
    new _$AddPluginRequestSerializer();

class _$AddPluginRequestSerializer
    implements StructuredSerializer<AddPluginRequest> {
  @override
  final Iterable<Type> types = const [AddPluginRequest, _$AddPluginRequest];
  @override
  final String wireName = 'AddPluginRequest';

  @override
  Iterable<Object> serialize(Serializers serializers, AddPluginRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'version',
      serializers.serialize(object.version,
          specifiedType: const FullType(String)),
      'from',
      serializers.serialize(object.from, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  AddPluginRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AddPluginRequestBuilder();

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
        case 'version':
          result.version = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'from':
          result.from = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AddPluginRequest extends AddPluginRequest {
  @override
  final String id;
  @override
  final String version;
  @override
  final String from;

  factory _$AddPluginRequest(
          [void Function(AddPluginRequestBuilder) updates]) =>
      (new AddPluginRequestBuilder()..update(updates)).build();

  _$AddPluginRequest._({this.id, this.version, this.from}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('AddPluginRequest', 'id');
    }
    if (version == null) {
      throw new BuiltValueNullFieldError('AddPluginRequest', 'version');
    }
    if (from == null) {
      throw new BuiltValueNullFieldError('AddPluginRequest', 'from');
    }
  }

  @override
  AddPluginRequest rebuild(void Function(AddPluginRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddPluginRequestBuilder toBuilder() =>
      new AddPluginRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddPluginRequest &&
        id == other.id &&
        version == other.version &&
        from == other.from;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, id.hashCode), version.hashCode), from.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AddPluginRequest')
          ..add('id', id)
          ..add('version', version)
          ..add('from', from))
        .toString();
  }
}

class AddPluginRequestBuilder
    implements Builder<AddPluginRequest, AddPluginRequestBuilder> {
  _$AddPluginRequest _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _version;
  String get version => _$this._version;
  set version(String version) => _$this._version = version;

  String _from;
  String get from => _$this._from;
  set from(String from) => _$this._from = from;

  AddPluginRequestBuilder() {
    AddPluginRequest._initializeBuilder(this);
  }

  AddPluginRequestBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _version = _$v.version;
      _from = _$v.from;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddPluginRequest other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AddPluginRequest;
  }

  @override
  void update(void Function(AddPluginRequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AddPluginRequest build() {
    final _$result =
        _$v ?? new _$AddPluginRequest._(id: id, version: version, from: from);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
