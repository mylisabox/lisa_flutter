// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'login_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LoginRequest> _$loginRequestSerializer =
    new _$LoginRequestSerializer();

class _$LoginRequestSerializer implements StructuredSerializer<LoginRequest> {
  @override
  final Iterable<Type> types = const [LoginRequest, _$LoginRequest];
  @override
  final String wireName = 'LoginRequest';

  @override
  Iterable<Object> serialize(Serializers serializers, LoginRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'password',
      serializers.serialize(object.password,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  LoginRequest deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LoginRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$LoginRequest extends LoginRequest {
  @override
  final String email;
  @override
  final String password;

  factory _$LoginRequest([void Function(LoginRequestBuilder) updates]) =>
      (new LoginRequestBuilder()..update(updates)).build();

  _$LoginRequest._({this.email, this.password}) : super._() {
    if (email == null) {
      throw new BuiltValueNullFieldError('LoginRequest', 'email');
    }
    if (password == null) {
      throw new BuiltValueNullFieldError('LoginRequest', 'password');
    }
  }

  @override
  LoginRequest rebuild(void Function(LoginRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginRequestBuilder toBuilder() => new LoginRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginRequest &&
        email == other.email &&
        password == other.password;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, email.hashCode), password.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoginRequest')
          ..add('email', email)
          ..add('password', password))
        .toString();
  }
}

class LoginRequestBuilder
    implements Builder<LoginRequest, LoginRequestBuilder> {
  _$LoginRequest _$v;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  LoginRequestBuilder() {
    LoginRequest._initializeBuilder(this);
  }

  LoginRequestBuilder get _$this {
    if (_$v != null) {
      _email = _$v.email;
      _password = _$v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginRequest other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoginRequest;
  }

  @override
  void update(void Function(LoginRequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginRequest build() {
    final _$result =
        _$v ?? new _$LoginRequest._(email: email, password: password);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
