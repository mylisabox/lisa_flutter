//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'dart:async';
import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:lisa_server_sdk/model/scene.dart';

class SceneApi {
    final Dio _dio;
    Serializers _serializers;

    SceneApi(this._dio, this._serializers);

    ///
    ///
    ///
    Future<Response<void>> deleteScene(
        String scene, {
        CancelToken cancelToken,
        Map<String, dynamic> headers,
        Map<String, dynamic> extra,
        ValidateStatus validateStatus,
        ProgressCallback onSendProgress,
        ProgressCallback onReceiveProgress,
    }) async {
        final String _path = '/api/v1/chatbot/userBot/{scene}'.replaceAll('{' r'scene' '}', scene.toString());

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
                method: 'delete'.toUpperCase(),
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
        );
    }

    ///
    ///
    ///
    Future<Response<BuiltList<Scene>>> getScene({
        CancelToken cancelToken,
        Map<String, dynamic> headers,
        Map<String, dynamic> extra,
        ValidateStatus validateStatus,
        ProgressCallback onSendProgress,
        ProgressCallback onReceiveProgress,
    }) async {
        final String _path = '/api/v1/chatbot/userBot';

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
            const collectionType = BuiltList;
            const type = FullType(collectionType, [FullType(Scene)]);
            final data = _serializers.deserialize(
                response.data is String
                ? jsonDecode(response.data as String)
                : response.data,
                specifiedType: type,
            ) as BuiltList<Scene>;

            return Response<BuiltList<Scene>>(
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
    Future<Response<void>> saveScene(
        Scene scene, {
        CancelToken cancelToken,
        Map<String, dynamic> headers,
        Map<String, dynamic> extra,
        ValidateStatus validateStatus,
        ProgressCallback onSendProgress,
        ProgressCallback onReceiveProgress,
    }) async {
        final String _path = '/api/v1/chatbot/userBot';

        final queryParams = <String, dynamic>{};
        final headerParams = <String, dynamic>{
            if (headers != null) ...headers,
        };
        dynamic bodyData;

        queryParams.removeWhere((key, dynamic value) => value == null);
        headerParams.removeWhere((key, dynamic value) => value == null);

        final contentTypes = <String>[
            'application/json',
        ];

        final bodySerializer = _serializers.serializerForType(Scene) as Serializer<Scene>;
        final serializedBody = _serializers.serializeWith(bodySerializer, scene);
        final jsonscene = json.encode(serializedBody);
        bodyData = jsonscene;

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
        );
    }

}
