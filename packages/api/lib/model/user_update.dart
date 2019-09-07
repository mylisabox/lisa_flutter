import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'user_update.jser.dart';

class UserUpdate {
  @Alias('id')
  final int id;

  @Alias('email')
  final String email;

  @Alias('firstname')
  final String firstname;

  @Alias('lang')
  final String lang;

  @Alias('lastname')
  final String lastname;

  @Alias('mobile')
  final String mobile;

  @Alias('password')
  final String password;

  @Alias('avatar')
  final List<int> avatar;

  UserUpdate(
      {this.id = null,
      this.email = null,
      this.firstname = null,
      this.lang = null,
      this.lastname = null,
      this.mobile = null,
      this.password = null,
      this.avatar = null});

  @override
  String toString() {
    return 'UserUpdate[id=$id, email=$email, firstname=$firstname, lang=$lang, lastname=$lastname, mobile=$mobile, password=$password, avatar=$avatar, ]';
  }
}

@GenSerializer(nullableFields: false)
class UserUpdateSerializer extends Serializer<UserUpdate> with _$UserUpdateSerializer {}
