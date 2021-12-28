import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:lisa_flutter/src/common/utils/base_url_provider.dart';
import 'package:lisa_flutter/src/preferences/preferences_provider.dart';
import 'package:lisa_server_sdk/lisa_server_sdk.dart';
import 'package:logging/logging.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

enum ServerStatus { initialized, uninitialized, noHost }

abstract class _UserStore with Store, BaseUrlProvider {
  final PreferencesProvider _preferencesProvider;
  final BackendApiProvider _apiProvider;
  final _logger = Logger('UserStore');

  _UserStore({
    BackendApiProvider? api,
    PreferencesProvider? prefs,
  })  : _apiProvider = api ?? BackendApiProvider(),
        _preferencesProvider = prefs ?? PreferencesProvider();

  @observable
  User? user;

  @observable
  ServerStatus serverStatus = ServerStatus.noHost;

  @observable
  String proxyUrl = '';

  @observable
  String? currentToken;

  @computed
  String? get avatar => user?.avatar == null ? null : '$baseUrl${user!.avatar}';

  @computed
  String? get lang => user?.lang;

  @computed
  String get fullName => user?.firstName == null ? '' : user!.firstName;

  String? get lastRoute => _preferencesProvider.prefs.getString(PreferencesProvider.keyLastRoute);

  Future<void> _checkServerStatus() async {
    try {
      final response = (await _apiProvider.api.getConfigApi().isInitialized()).data!;
      serverStatus = response.initialized ? ServerStatus.initialized : ServerStatus.uninitialized;
    } catch (err, stack) {
      serverStatus = ServerStatus.noHost;
      _logger.warning('No host found $err', err, stack);
    }
  }

  @action
  Future init() async {
    final token = await _preferencesProvider.securePrefs.read(key: PreferencesProvider.keyToken);
    if (user != null) {
      //already initialized
      return;
    }

    if (serverStatus == ServerStatus.noHost) {
      await _checkServerStatus();
    }

    if (token == null) {

    } else {
      serverStatus = ServerStatus.initialized;
      _apiProvider.setToken(token);
      try {
        proxyUrl = getProxyUrl();
        user = (await _apiProvider.api.getUserApi().getProfile()).data;
      } on DioError catch (err) {
        proxyUrl = getProxyUrl();
        if (err.response?.statusCode == 404) {
          await _checkServerStatus();
        }
        rethrow;
      }
    }
    currentToken = token;
  }

  @action
  Future changeLang(String lang) async {
    if (lang != user?.lang) {
      final result = (await _apiProvider.api.getUserApi().saveProfile(
                lang: lang,
              ))
          .data;
      setUser(result);
    }
  }

  @action
  void setUser(User? user) {
    this.user = user;
  }

  @action
  Future updateUser({
    required String email,
    String? firstName,
    String? lastName,
    String? phone,
    String? lang,
    String? password,
    Uint8List? avatarData,
  }) async {
    final result = (await _apiProvider.api.getUserApi().saveProfile(
              email: email,
              firstName: firstName,
              lastName: lastName,
              lang: lang,
              mobile: phone,
              password: password,
              avatar: avatarData == null ? null : MultipartFile.fromBytes(avatarData, filename: 'avatar'),
            ))
        .data;

    setUser(result);
  }

  @action
  Future logout() async {
    await _preferencesProvider.securePrefs.deleteAll();
    setUser(null);
  }
}
