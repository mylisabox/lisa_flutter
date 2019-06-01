import 'package:jaguar_serializer/jaguar_serializer.dart';


part 'user.jser.dart';

class User {
  
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
  
  @Alias('avatar')
  final String avatar;
  

  User(
      

{
    
     this.id = null,  
     this.email = null,   this.firstname = null,  
    
     this.lang = null,   this.lastname = null,  
     this.mobile = null,  
     this.avatar = null 
    
    }
  );

  @override
  String toString() {
    return 'User[id=$id, email=$email, firstname=$firstname, lang=$lang, lastname=$lastname, mobile=$mobile, avatar=$avatar, ]';
  }
}

@GenSerializer(nullableFields: false)
class UserSerializer extends Serializer<User> with _$UserSerializer {

}

