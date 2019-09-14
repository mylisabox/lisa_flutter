import 'package:jaguar_serializer/jaguar_serializer.dart';


import 'package:lisa_server_sdk/model/user.dart';

part 'login_response.jser.dart';

class LoginResponse {
  
  @Alias('token', isNullable: false,  )
  final String token;
  
  @Alias('user', isNullable: false,  )
  final User user;
  

  LoginResponse(
      

{
    
     this.token = null,  
     this.user = null 
    }
  );

  @override
  String toString() {
    return 'LoginResponse[token=$token, user=$user, ]';
  }
}

@GenSerializer(nullableFields: false)
class LoginResponseSerializer extends Serializer<LoginResponse> with _$LoginResponseSerializer {

}

