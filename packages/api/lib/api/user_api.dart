import 'package:jaguar_retrofit/annotations/annotations.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_mimetype/jaguar_mimetype.dart';
import 'dart:async';

import 'package:lisa_server_sdk/model/user.dart';

part 'user_api.jretro.dart';

@GenApiClient()
class UserApi extends ApiClient with _$UserApiClient {
    final Route base;
    final Map<String, CodecRepo> converters;
    final Duration timeout;

    UserApi({this.base, this.converters, this.timeout = const Duration(minutes: 2)});

    /// 
    ///
    /// 
    @GetReq(path: "/api/v1/user", metadata: {"auth": [ {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header" }]})
    Future<User> getProfile(
        ) {
        return super.getProfile(

        ).timeout(timeout);
    }

    /// 
    ///
    /// 
    @PostReq(path: "/api/v1/user", metadata: {"auth": [ {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header" }]})
    Future<User> saveProfile(
            
            @AsMultipartField() int id, 
            
            @AsMultipartField() String email, 
            
            @AsMultipartField() String firstname, 
            
            @AsMultipartField() String lang, 
            
            @AsMultipartField() String lastname, 
            
            @AsMultipartField() String mobile, 
            
            @AsMultipartField() String password, 
            
            @AsMultipartField() MultipartFile avatar
        ) {
        return super.saveProfile(

        
        id, 
        
        email, 
        
        firstname, 
        
        lang, 
        
        lastname, 
        
        mobile, 
        
        password, 
        
        avatar
        ).timeout(timeout);
    }


}
