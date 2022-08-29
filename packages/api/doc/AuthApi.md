# lisa_server_sdk.api.AuthApi

## Load the API package
```dart
import 'package:lisa_server_sdk/api.dart';
```

All URIs are relative to *http://mylisabox:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**login**](AuthApi.md#login) | **POST** /api/v1/auth/login | 
[**refreshToken**](AuthApi.md#refreshtoken) | **POST** /api/v1/auth/token | 
[**register**](AuthApi.md#register) | **POST** /api/v1/auth/register | 


# **login**
> LoginResponse login(loginRequest)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';

final api = LisaServerSdk().getAuthApi();
final LoginRequest loginRequest = ; // LoginRequest | 

try { 
    final response = api.login(loginRequest);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AuthApi->login: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginRequest** | [**LoginRequest**](LoginRequest.md)|  | 

### Return type

[**LoginResponse**](LoginResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **refreshToken**
> LoginResponse refreshToken(refreshTokenRequest)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';

final api = LisaServerSdk().getAuthApi();
final RefreshTokenRequest refreshTokenRequest = ; // RefreshTokenRequest | 

try { 
    final response = api.refreshToken(refreshTokenRequest);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AuthApi->refreshToken: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **refreshTokenRequest** | [**RefreshTokenRequest**](RefreshTokenRequest.md)|  | 

### Return type

[**LoginResponse**](LoginResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **register**
> LoginResponse register(userUpdate)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';

final api = LisaServerSdk().getAuthApi();
final UserUpdate userUpdate = ; // UserUpdate | 

try { 
    final response = api.register(userUpdate);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AuthApi->register: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userUpdate** | [**UserUpdate**](UserUpdate.md)|  | 

### Return type

[**LoginResponse**](LoginResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

