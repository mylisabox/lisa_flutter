import 'package:jaguar_serializer/jaguar_serializer.dart';


part 'user.jser.dart';

class User {
  
  @Alias('id', isNullable: false,  )
  final int id;
  
  @Alias('email', isNullable: false,  )
  final String email;
  
  @Alias('firstname', isNullable: false,  )
  final String firstname;
  
  @Alias('lang', isNullable: false,  )
  final String lang;
  
  @Alias('lastname', isNullable: false,  )
  final String lastname;
  
  @Alias('mobile', isNullable: false,  )
  final String mobile;
  
  @Alias('avatar', isNullable: false,  )
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

