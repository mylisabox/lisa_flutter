//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'dart:async';
import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:lisa_server_sdk/model/add_plugin_request.dart';
import 'package:lisa_server_sdk/model/plugin.dart';
import 'package:lisa_server_sdk/model/store_plugin.dart';

class PluginApi {
    final Dio _dio;
    Serializers _serializers;

    PluginApi(this._dio, this._serializers);

    ///
    ///
    ///
    Future<Response<BuiltList<StorePlugin>>> getStorePlugins({
        CancelToken cancelToken,
        Map<String, dynamic> headers,
        Map<String, dynamic> extra,
        ValidateStatus validateStatus,
        ProgressCallback onSendProgress,
        ProgressCallback onReceiveProgress,
    }) async {
        final String _path = '/api/v1/plugin/store';

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
            const type = FullType(collectionType, [FullType(StorePlugin)]);
            final data = _serializers.deserialize(
                response.data is String
                ? jsonDecode(response.data as String)
                : response.data,
                specifiedType: type,
            ) as BuiltList<StorePlugin>;

            return Response<BuiltList<StorePlugin>>(
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
    Future<Response<void>> installPlugin(
        AddPluginRequest addPluginRequest, {
        CancelToken cancelToken,
        Map<String, dynamic> headers,
        Map<String, dynamic> extra,
        ValidateStatus validateStatus,
        ProgressCallback onSendProgress,
        ProgressCallback onReceiveProgress,
    }) async {
        final String _path = '/api/v1/plugin/install';

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

        final bodySerializer = _serializers.serializerForType(AddPluginRequest) as Serializer<AddPluginRequest>;
        final serializedBody = _serializers.serializeWith(bodySerializer, addPluginRequest);
        final jsonaddPluginRequest = json.encode(serializedBody);
        bodyData = jsonaddPluginRequest;

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

    ///
    ///
    ///
    Future<Response<BuiltMap<String, JsonObject>>> pairing(
        String pluginName,
        String driver,
        BuiltMap<String, JsonObject> requestBody, {
        CancelToken cancelToken,
        Map<String, dynamic> headers,
        Map<String, dynamic> extra,
        ValidateStatus validateStatus,
        ProgressCallback onSendProgress,
        ProgressCallback onReceiveProgress,
    }) async {
        final String _path = '/api/v1/plugin/{pluginName}/drivers/{driver}/pairing'.replaceAll('{' r'pluginName' '}', pluginName.toString()).replaceAll('{' r'driver' '}', driver.toString());

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

        const type = FullType(BuiltMap, [FullType(String), FullType(JsonObject)]);
        final serializedBody = _serializers.serialize(requestBody, specifiedType: type);
        final jsonrequestBody = json.encode(serializedBody);
        bodyData = jsonrequestBody;

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
            const collectionType = BuiltMap;
            const type = FullType(collectionType, [FullType(String), FullType(JsonObject)]);
            final data = _serializers.deserialize(
                response.data is String
                ? jsonDecode(response.data as String)
                : response.data,
                specifiedType: type,
            ) as BuiltMap<String, JsonObject>;

            return Response<BuiltMap<String, JsonObject>>(
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
    Future<Response<BuiltList<Plugin>>> searchPlugins(
        String query, {
        bool activated,
        CancelToken cancelToken,
        Map<String, dynamic> headers,
        Map<String, dynamic> extra,
        ValidateStatus validateStatus,
        ProgressCallback onSendProgress,
        ProgressCallback onReceiveProgress,
    }) async {
        final String _path = '/api/v1/plugin/search';

        final queryParams = <String, dynamic>{};
        final headerParams = <String, dynamic>{
            if (headers != null) ...headers,
        };
        dynamic bodyData;

        queryParams[r'query'] = query;
        queryParams[r'activated'] = activated;
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
            const type = FullType(collectionType, [FullType(Plugin)]);
            final data = _serializers.deserialize(
                response.data is String
                ? jsonDecode(response.data as String)
                : response.data,
                specifiedType: type,
            ) as BuiltList<Plugin>;

            return Response<BuiltList<Plugin>>(
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
    Future<Response<void>> uninstallPlugin(
        String pluginName, {
        CancelToken cancelToken,
        Map<String, dynamic> headers,
        Map<String, dynamic> extra,
        ValidateStatus validateStatus,
        ProgressCallback onSendProgress,
        ProgressCallback onReceiveProgress,
    }) async {
        final String _path = '/api/v1/plugin/{pluginName}/uninstall'.replaceAll('{' r'pluginName' '}', pluginName.toString());

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

}
