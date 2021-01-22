//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login_request.g.dart';

abstract class LoginRequest implements Built<LoginRequest, LoginRequestBuilder> {

    @BuiltValueField(wireName: r'email')
    String get email;

    @BuiltValueField(wireName: r'password')
    String get password;

    // Boilerplate code needed to wire-up generated code
    LoginRequest._();

    static void _initializeBuilder(LoginRequestBuilder b) => b;

    factory LoginRequest([void updates(LoginRequestBuilder b)]) = _$LoginRequest;
    static Serializer<LoginRequest> get serializer => _$loginRequestSerializer;
}

