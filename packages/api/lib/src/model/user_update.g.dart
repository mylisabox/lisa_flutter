// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_update.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserUpdate extends UserUpdate {
  @override
  final String? email;
  @override
  final String? firstName;
  @override
  final String? lang;
  @override
  final String? lastName;
  @override
  final String? mobile;
  @override
  final String? password;
  @override
  final Uint8List? avatar;

  factory _$UserUpdate([void Function(UserUpdateBuilder)? updates]) =>
      (new UserUpdateBuilder()..update(updates)).build();

  _$UserUpdate._(
      {this.email,
      this.firstName,
      this.lang,
      this.lastName,
      this.mobile,
      this.password,
      this.avatar})
      : super._();

  @override
  UserUpdate rebuild(void Function(UserUpdateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserUpdateBuilder toBuilder() => new UserUpdateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserUpdate &&
        email == other.email &&
        firstName == other.firstName &&
        lang == other.lang &&
        lastName == other.lastName &&
        mobile == other.mobile &&
        password == other.password &&
        avatar == other.avatar;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, email.hashCode), firstName.hashCode),
                        lang.hashCode),
                    lastName.hashCode),
                mobile.hashCode),
            password.hashCode),
        avatar.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserUpdate')
          ..add('email', email)
          ..add('firstName', firstName)
          ..add('lang', lang)
          ..add('lastName', lastName)
          ..add('mobile', mobile)
          ..add('password', password)
          ..add('avatar', avatar))
        .toString();
  }
}

class UserUpdateBuilder implements Builder<UserUpdate, UserUpdateBuilder> {
  _$UserUpdate? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lang;
  String? get lang => _$this._lang;
  set lang(String? lang) => _$this._lang = lang;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _mobile;
  String? get mobile => _$this._mobile;
  set mobile(String? mobile) => _$this._mobile = mobile;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  Uint8List? _avatar;
  Uint8List? get avatar => _$this._avatar;
  set avatar(Uint8List? avatar) => _$this._avatar = avatar;

  UserUpdateBuilder() {
    UserUpdate._defaults(this);
  }

  UserUpdateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _firstName = $v.firstName;
      _lang = $v.lang;
      _lastName = $v.lastName;
      _mobile = $v.mobile;
      _password = $v.password;
      _avatar = $v.avatar;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserUpdate other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserUpdate;
  }

  @override
  void update(void Function(UserUpdateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserUpdate build() {
    final _$result = _$v ??
        new _$UserUpdate._(
            email: email,
            firstName: firstName,
            lang: lang,
            lastName: lastName,
            mobile: mobile,
            password: password,
            avatar: avatar);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
