//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:lisa_server_sdk/api_util.dart';
import 'package:lisa_server_sdk/model/user.dart';

class UserApi {
    final Dio _dio;
    Serializers _serializers;

    UserApi(this._dio, this._serializers);

    ///
    ///
    ///
    Future<Response<User>> getProfile({
        CancelToken cancelToken,
        Map<String, dynamic> headers,
        Map<String, dynamic> extra,
        ValidateStatus validateStatus,
        ProgressCallback onSendProgress,
        ProgressCallback onReceiveProgress,
    }) async {
        final String _path = '/api/v1/user';

        final queryParams = <String, dynamic>{};
        final headerParams = <String, dynamic>{
            if (headers != null) ...headers,
        };
        dynamic bodyData;

        queryParams.removeWhere((key, dynamic value) => value == null);
        headerParams.removeWhere((key, dynamic value) => value == null);

        final contentTypes = <String>[];

        return _dio.request<dynamic>(
            _path,
            queryParameters: queryParams,
            data: bodyData,
            options: Options(
                method: 'get'.toUpperCase(),
                headers: headerParams,
                extra: <String, dynamic>{
                    'secure': <Map<String, String>>[
                        {
                            'type': 'apiKey',
                            'name': 'Bearer',
                            'keyName': 'Authorization',
                            'where': 'header',
                        },
                    ],
                    if (extra != null) ...extra,
                },
                validateStatus: validateStatus,
                contentType: contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
            ),
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
        ).then((response) {
            final serializer = _serializers.serializerForType(User) as Serializer<User>;
            final data = _serializers.deserializeWith<User>(
                serializer,
                response.data is String ? jsonDecode(response.data as String) : response.data,
            );

            return Response<User>(
                data: data,
                headers: response.headers,
                request: response.request,
                redirects: response.redirects,
                statusCode: response.statusCode,
                statusMessage: response.statusMessage,
                extra: response.extra,
            );
        });
    }

    ///
    ///
    ///
    Future<Response<User>> saveProfile(
        int id,
        String email,
        String firstname,
        String lang,
        String lastname,
        String mobile,
        String password,
        Uint8List avatar, {
        CancelToken cancelToken,
        Map<String, dynamic> headers,
        Map<String, dynamic> extra,
        ValidateStatus validateStatus,
        ProgressCallback onSendProgress,
        ProgressCallback onReceiveProgress,
    }) async {
        final String _path = '/api/v1/user';

        final queryParams = <String, dynamic>{};
        final headerParams = <String, dynamic>{
            if (headers != null) ...headers,
        };
        dynamic bodyData;

        queryParams.removeWhere((key, dynamic value) => value == null);
        headerParams.removeWhere((key, dynamic value) => value == null);

        final contentTypes = <String>[
            'multipart/form-data',
        ];

        final formData = <String, dynamic>{};
        if (id != null) {
            formData[r'id'] = parameterToString(_serializers, id);
        }
        if (email != null) {
            formData[r'email'] = parameterToString(_serializers, email);
        }
        if (firstname != null) {
            formData[r'firstname'] = parameterToString(_serializers, firstname);
        }
        if (lang != null) {
            formData[r'lang'] = parameterToString(_serializers, lang);
        }
        if (lastname != null) {
            formData[r'lastname'] = parameterToString(_serializers, lastname);
        }
        if (mobile != null) {
            formData[r'mobile'] = parameterToString(_serializers, mobile);
        }
        if (password != null) {
            formData[r'password'] = parameterToString(_serializers, password);
        }
        if (avatar != null) {
            formData[r'avatar'] = MultipartFile.fromBytes(avatar, filename: r'avatar');
        }
        bodyData = FormData.fromMap(formData);

        return _dio.request<dynamic>(
            _path,
            queryParameters: queryParams,
            data: bodyData,
            options: Options(
                method: 'post'.toUpperCase(),
                headers: headerParams,
                extra: <String, dynamic>{
                    'secure': <Map<String, String>>[
                        {
                            'type': 'apiKey',
                            'name': 'Bearer',
                            'keyName': 'Authorization',
                            'where': 'header',
                        },
                    ],
                    if (extra != null) ...extra,
                },
                validateStatus: validateStatus,
                contentType: contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
            ),
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
        ).then((response) {
            final serializer = _serializers.serializerForType(User) as Serializer<User>;
            final data = _serializers.deserializeWith<User>(
                serializer,
                response.data is String ? jsonDecode(response.data as String) : response.data,
            );

            return Response<User>(
                data: data,
                headers: response.headers,
                request: response.request,
                redirects: response.redirects,
                statusCode: response.statusCode,
                statusMessage: response.statusMessage,
                extra: response.extra,
            );
        });
    }

}
