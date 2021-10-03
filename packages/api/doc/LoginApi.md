# lisa_server_sdk.api.LoginApi

## Load the API package
```dart
import 'package:lisa_server_sdk/api.dart';
```

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**login**](LoginApi.md#login) | **POST** /api/v1/auth/login | 
[**register**](LoginApi.md#register) | **POST** /api/v1/auth/register | 


# **login**
> LoginResponse login(loginRequest)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';

final api = LisaServerSdk().getLoginApi();
final LoginRequest loginRequest = ; // LoginRequest | 

try { 
    final response = api.login(loginRequest);
    print(response);
} catch on DioError (e) {
    print('Exception when calling LoginApi->login: $e\n');
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

# **register**
> LoginResponse register(userUpdate)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';

final api = LisaServerSdk().getLoginApi();
final UserUpdate userUpdate = ; // UserUpdate | 

try { 
    final response = api.register(userUpdate);
    print(response);
} catch on DioError (e) {
    print('Exception when calling LoginApi->register: $e\n');
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

