# lisa_server_sdk.api.UserApi

## Load the API package
```dart
import 'package:lisa_server_sdk/api.dart';
```

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getProfile**](UserApi.md#getProfile) | **Get** /api/v1/user | 
[**saveProfile**](UserApi.md#saveProfile) | **Post** /api/v1/user | 


# **getProfile**
> User getProfile()



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//lisa_server_sdk.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//lisa_server_sdk.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new UserApi();

try { 
    var result = api_instance.getProfile();
    print(result);
} catch (e) {
    print("Exception when calling UserApi->getProfile: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**User**](User.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **saveProfile**
> User saveProfile(id, email, firstname, lang, lastname, mobile, password, avatar)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//lisa_server_sdk.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//lisa_server_sdk.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new UserApi();
var id = 56; // int | 
var email = ; // String | 
var firstname = firstname_example; // String | 
var lang = lang_example; // String | 
var lastname = lastname_example; // String | 
var mobile = mobile_example; // String | 
var password = password_example; // String | 
var avatar = BINARY_DATA_HERE; // MultipartFile | 

try { 
    var result = api_instance.saveProfile(id, email, firstname, lang, lastname, mobile, password, avatar);
    print(result);
} catch (e) {
    print("Exception when calling UserApi->saveProfile: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [optional] [default to null]
 **email** | [**String**](String.md)|  | [optional] [default to null]
 **firstname** | **String**|  | [optional] [default to null]
 **lang** | **String**|  | [optional] [default to null]
 **lastname** | **String**|  | [optional] [default to null]
 **mobile** | **String**|  | [optional] [default to null]
 **password** | **String**|  | [optional] [default to null]
 **avatar** | **MultipartFile****MultipartFile**|  | [optional] [default to null]

### Return type

[**User**](User.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

