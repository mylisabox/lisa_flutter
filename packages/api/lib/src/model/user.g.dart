// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$User extends User {
  @override
  final int id;
  @override
  final String email;
  @override
  final String firstName;
  @override
  final String lang;
  @override
  final String lastName;
  @override
  final String? mobile;
  @override
  final String? avatar;

  factory _$User([void Function(UserBuilder)? updates]) =>
      (new UserBuilder()..update(updates)).build();

  _$User._(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lang,
      required this.lastName,
      this.mobile,
      this.avatar})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'User', 'id');
    BuiltValueNullFieldError.checkNotNull(email, 'User', 'email');
    BuiltValueNullFieldError.checkNotNull(firstName, 'User', 'firstName');
    BuiltValueNullFieldError.checkNotNull(lang, 'User', 'lang');
    BuiltValueNullFieldError.checkNotNull(lastName, 'User', 'lastName');
  }

  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        id == other.id &&
        email == other.email &&
        firstName == other.firstName &&
        lang == other.lang &&
        lastName == other.lastName &&
        mobile == other.mobile &&
        avatar == other.avatar;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), email.hashCode),
                        firstName.hashCode),
                    lang.hashCode),
                lastName.hashCode),
            mobile.hashCode),
        avatar.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('User')
          ..add('id', id)
          ..add('email', email)
          ..add('firstName', firstName)
          ..add('lang', lang)
          ..add('lastName', lastName)
          ..add('mobile', mobile)
          ..add('avatar', avatar))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

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

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  UserBuilder() {
    User._defaults(this);
  }

  UserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _email = $v.email;
      _firstName = $v.firstName;
      _lang = $v.lang;
      _lastName = $v.lastName;
      _mobile = $v.mobile;
      _avatar = $v.avatar;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$User build() {
    final _$result = _$v ??
        new _$User._(
            id: BuiltValueNullFieldError.checkNotNull(id, 'User', 'id'),
            email:
                BuiltValueNullFieldError.checkNotNull(email, 'User', 'email'),
            firstName: BuiltValueNullFieldError.checkNotNull(
                firstName, 'User', 'firstName'),
            lang: BuiltValueNullFieldError.checkNotNull(lang, 'User', 'lang'),
            lastName: BuiltValueNullFieldError.checkNotNull(
                lastName, 'User', 'lastName'),
            mobile: mobile,
            avatar: avatar);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
