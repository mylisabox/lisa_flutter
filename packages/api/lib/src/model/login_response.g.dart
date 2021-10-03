// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LoginResponse extends LoginResponse {
  @override
  final String token;
  @override
  final String refreshToken;

  factory _$LoginResponse([void Function(LoginResponseBuilder)? updates]) =>
      (new LoginResponseBuilder()..update(updates)).build();

  _$LoginResponse._({required this.token, required this.refreshToken})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(token, 'LoginResponse', 'token');
    BuiltValueNullFieldError.checkNotNull(
        refreshToken, 'LoginResponse', 'refreshToken');
  }

  @override
  LoginResponse rebuild(void Function(LoginResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginResponseBuilder toBuilder() => new LoginResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginResponse &&
        token == other.token &&
        refreshToken == other.refreshToken;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, token.hashCode), refreshToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoginResponse')
          ..add('token', token)
          ..add('refreshToken', refreshToken))
        .toString();
  }
}

class LoginResponseBuilder
    implements Builder<LoginResponse, LoginResponseBuilder> {
  _$LoginResponse? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  LoginResponseBuilder() {
    LoginResponse._defaults(this);
  }

  LoginResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _refreshToken = $v.refreshToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginResponse;
  }

  @override
  void update(void Function(LoginResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginResponse build() {
    final _$result = _$v ??
        new _$LoginResponse._(
            token: BuiltValueNullFieldError.checkNotNull(
                token, 'LoginResponse', 'token'),
            refreshToken: BuiltValueNullFieldError.checkNotNull(
                refreshToken, 'LoginResponse', 'refreshToken'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
