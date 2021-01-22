//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'dart:async';
import 'dart:convert';

import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:lisa_server_sdk/model/interact_request.dart';
import 'package:lisa_server_sdk/model/interact_response.dart';

class ChatbotApi {
    final Dio _dio;
    Serializers _serializers;

    ChatbotApi(this._dio, this._serializers);

    ///
    ///
    ///
    Future<Response<InteractResponse>> interact(
        InteractRequest interactRequest, {
        CancelToken cancelToken,
        Map<String, dynamic> headers,
        Map<String, dynamic> extra,
        ValidateStatus validateStatus,
        ProgressCallback onSendProgress,
        ProgressCallback onReceiveProgress,
    }) async {
        final String _path = '/api/v1/chatbot/interact';

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

        final bodySerializer = _serializers.serializerForType(InteractRequest) as Serializer<InteractRequest>;
        final serializedBody = _serializers.serializeWith(bodySerializer, interactRequest);
        final jsoninteractRequest = json.encode(serializedBody);
        bodyData = jsoninteractRequest;

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
            final serializer = _serializers.serializerForType(InteractResponse) as Serializer<InteractResponse>;
            final data = _serializers.deserializeWith<InteractResponse>(
                serializer,
                response.data is String ? jsonDecode(response.data as String) : response.data,
            );

            return Response<InteractResponse>(
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
