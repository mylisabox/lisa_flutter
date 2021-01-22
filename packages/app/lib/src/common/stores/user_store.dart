import 'dart:typed_data';

import 'package:crypted_preferences/crypted_preferences.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:lisa_flutter/src/common/utils/base_url_provider.dart';
import 'package:lisa_flutter/src/preferences/preferences_provider.dart';
import 'package:lisa_server_sdk/api.dart';
import 'package:lisa_server_sdk/model/user.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store, BaseUrlProvider {
  final Preferences _preferences;
  final LisaServerSdk _api;

  _UserStore({
    LisaServerSdk api,
    Preferences prefs,
  })  : _api = api ?? BackendApiProvider().api,
        _preferences = prefs ?? PreferencesProvider().prefs;

  @observable
  User user;

  @computed
  String get avatar => user?.avatar == null ? null : '$baseUrl${user.avatar}';

  @computed
  String get lang => user?.lang;

  @computed
  String get fullName => user?.firstname == null ? user?.email ?? '' : user.firstname;

  String get lastRoute => _preferences.getString(PreferencesProvider.keyLastRoute);

  @action
  Future init() async {
    final token = _preferences.getString(PreferencesProvider.keyToken);
    if (token != null) {
      _api.setApiKey(kAuthKey, 'JWT $token');
      user = (await _api.getUserApi().getProfile()).data;
    }
  }

  @action
  Future changeLang(String lang) async {
    if (lang != user.lang) {
      final result = (await _api.getUserApi().saveProfile(
            user.id,
            user.email,
            user.firstname,
            lang,
            user.lastname,
            user.mobile,
            null,
            null,
          )).data;
      setUser(result);
    }
  }

  @action
  void setUser(User user) {
    this.user = user;
  }

  @action
  Future updateUser({
    String email,
    String firstName,
    String lastName,
    String phone,
    String password,
    Uint8List avatarData,
  }) async {
    final result = (await _api.getUserApi().saveProfile(
          user.id,
          email,
          firstName,
          user.lang,
          lastName,
          phone,
          password,
          avatarData)
        ).data;

    setUser(result);
  }

  @action
  Future logout() async {
    try {
      await _api.getLoginApi().logout();
    } catch (ex) {
      //shallow errors as token might be expired
    }
    await _preferences.remove(PreferencesProvider.keyToken);
    setUser(null);
  }

}
