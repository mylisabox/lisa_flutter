// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'is_initialized.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<IsInitialized> _$isInitializedSerializer =
    new _$IsInitializedSerializer();

class _$IsInitializedSerializer implements StructuredSerializer<IsInitialized> {
  @override
  final Iterable<Type> types = const [IsInitialized, _$IsInitialized];
  @override
  final String wireName = 'IsInitialized';

  @override
  Iterable<Object> serialize(Serializers serializers, IsInitialized object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'initialized',
      serializers.serialize(object.initialized,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  IsInitialized deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new IsInitializedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'initialized':
          result.initialized = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$IsInitialized extends IsInitialized {
  @override
  final bool initialized;

  factory _$IsInitialized([void Function(IsInitializedBuilder) updates]) =>
      (new IsInitializedBuilder()..update(updates)).build();

  _$IsInitialized._({this.initialized}) : super._() {
    if (initialized == null) {
      throw new BuiltValueNullFieldError('IsInitialized', 'initialized');
    }
  }

  @override
  IsInitialized rebuild(void Function(IsInitializedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IsInitializedBuilder toBuilder() => new IsInitializedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IsInitialized && initialized == other.initialized;
  }

  @override
  int get hashCode {
    return $jf($jc(0, initialized.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('IsInitialized')
          ..add('initialized', initialized))
        .toString();
  }
}

class IsInitializedBuilder
    implements Builder<IsInitialized, IsInitializedBuilder> {
  _$IsInitialized _$v;

  bool _initialized;
  bool get initialized => _$this._initialized;
  set initialized(bool initialized) => _$this._initialized = initialized;

  IsInitializedBuilder() {
    IsInitialized._initializeBuilder(this);
  }

  IsInitializedBuilder get _$this {
    if (_$v != null) {
      _initialized = _$v.initialized;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IsInitialized other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$IsInitialized;
  }

  @override
  void update(void Function(IsInitializedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$IsInitialized build() {
    final _$result = _$v ?? new _$IsInitialized._(initialized: initialized);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
