// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_initialized.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$IsInitialized extends IsInitialized {
  @override
  final bool initialized;

  factory _$IsInitialized([void Function(IsInitializedBuilder)? updates]) =>
      (new IsInitializedBuilder()..update(updates)).build();

  _$IsInitialized._({required this.initialized}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        initialized, 'IsInitialized', 'initialized');
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
  _$IsInitialized? _$v;

  bool? _initialized;
  bool? get initialized => _$this._initialized;
  set initialized(bool? initialized) => _$this._initialized = initialized;

  IsInitializedBuilder() {
    IsInitialized._defaults(this);
  }

  IsInitializedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _initialized = $v.initialized;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IsInitialized other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IsInitialized;
  }

  @override
  void update(void Function(IsInitializedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$IsInitialized build() {
    final _$result = _$v ??
        new _$IsInitialized._(
            initialized: BuiltValueNullFieldError.checkNotNull(
                initialized, 'IsInitialized', 'initialized'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
