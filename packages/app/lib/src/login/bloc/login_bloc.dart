import 'package:crypted_preferences/crypted_preferences.dart';
import 'package:lisa_flutter/src/common/errors.dart';
import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:lisa_flutter/src/common/utils/validator.dart';
import 'package:lisa_flutter/src/preferences/preferences_provider.dart';
import 'package:lisa_server_sdk/api.dart';
import 'package:lisa_server_sdk/model/login_request.dart';
import 'package:mobx/mobx.dart';

part 'login_bloc.g.dart';

enum AuthMode { login, registration }

class LoginBloc = _LoginBloc with _$LoginBloc;

abstract class _LoginBloc with Store {
  static const keyLastEmail = 'last_email';
  final JaguarApiGen _api;
  final Preferences _preferences;
  final Validator _validator;

  @observable
  AuthMode mode = AuthMode.login;

  @observable
  String email = 'jimmy.aumard@gmail.com';

  @observable
  ErrorResult emailError;

  String password = 'adminadmin';

  @observable
  ErrorResult passwordError;

  _LoginBloc({
    JaguarApiGen api,
    Preferences prefs,
    Validator validator,
  })  : _api = api ?? BackendApiProvider().api,
        _validator = validator ?? Validator(),
        _preferences = prefs ?? PreferencesProvider().prefs;

  bool get hasError => emailError != null || passwordError != null;

  @action
  Future init() async {
    email = _preferences.getString(keyLastEmail, defaultValue: email);
    final response = await _api.getConfigApi().isInitialized();
    if (!response.initialized) {
      mode = AuthMode.registration;
    }
  }

  @action
  Future login() async {
    if (password == null || password.isEmpty) {
      passwordError = ErrorResult.fieldRequired;
    }

    if (email == null || email.isEmpty) {
      emailError = ErrorResult.fieldRequired;
    }

    if (email != null && !_validator.isEmail(email)) {
      emailError = ErrorResult.wrongEmail;
    }

    if (hasError) {
      throw ErrorResultException(emailError ?? passwordError);
    } else {
      try {
        final response = await _api.getLoginApi().login(LoginRequest(email: email, password: password));
        _preferences.setString(PreferencesProvider.keyToken, response.token);
        _preferences.setString(keyLastEmail, email);
        _api.setApiKey('Bearer', 'JWT ${response.token}');
      } catch (error, stackTrace) {
        handleCaughtError(error, stackTrace);
      }
    }
  }

  @action
  Future register() async {
    if (password == null || password.isEmpty) {
      passwordError = ErrorResult.fieldRequired;
    }

    if (email == null || email.isEmpty) {
      emailError = ErrorResult.fieldRequired;
    }

    if (email != null && !_validator.isEmail(email)) {
      emailError = ErrorResult.wrongEmail;
    }

    if (hasError) {
      throw ErrorResultException(emailError ?? passwordError); //todo generic form error ?
    } else {
      try {
        final response = await _api.getLoginApi().register(LoginRequest(email: email, password: password));
        _preferences.setString(PreferencesProvider.keyToken, response.token);
        _api.setApiKey('Authorization', response.token);
      } catch (error, stackTrace) {
        handleCaughtError(error, stackTrace);
      }
    }
  }

  @action
  void setEmail(String email) {
    emailError = null;
    this.email = email;
  }

  @action
  void setPassword(String password) {
    passwordError = null;
    this.password = password;
  }
}
