# lisa_server_sdk.api.RoomApi

## Load the API package
```dart
import 'package:lisa_server_sdk/api.dart';
```

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addRoom**](RoomApi.md#addRoom) | **Post** /api/v1/room | 
[**deleteRoom**](RoomApi.md#deleteRoom) | **Delete** /api/v1/room/:roomId | 
[**getRooms**](RoomApi.md#getRooms) | **Get** /api/v1/room | 
[**saveRoom**](RoomApi.md#saveRoom) | **Put** /api/v1/room/:roomId | 


# **addRoom**
> addRoom(room)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//lisa_server_sdk.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//lisa_server_sdk.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new RoomApi();
var room = new Room(); // Room | 

try { 
    api_instance.addRoom(room);
} catch (e) {
    print("Exception when calling RoomApi->addRoom: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **room** | [**Room**](Room.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteRoom**
> deleteRoom(roomId)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//lisa_server_sdk.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//lisa_server_sdk.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new RoomApi();
var roomId = 56; // int | 

try { 
    api_instance.deleteRoom(roomId);
} catch (e) {
    print("Exception when calling RoomApi->deleteRoom: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roomId** | **int**|  | [default to null]

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRooms**
> List<Room> getRooms()



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//lisa_server_sdk.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//lisa_server_sdk.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new RoomApi();

try { 
    var result = api_instance.getRooms();
    print(result);
} catch (e) {
    print("Exception when calling RoomApi->getRooms: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<Room>**](Room.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **saveRoom**
> saveRoom(roomId, room)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//lisa_server_sdk.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//lisa_server_sdk.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new RoomApi();
var roomId = 56; // int | 
var room = new Room(); // Room | 

try { 
    api_instance.saveRoom(roomId, room);
} catch (e) {
    print("Exception when calling RoomApi->saveRoom: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roomId** | **int**|  | [default to null]
 **room** | [**Room**](Room.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

