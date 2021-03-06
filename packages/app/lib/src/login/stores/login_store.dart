
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/errors.dart';
import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:lisa_flutter/src/common/presentation/loading_button.dart';
import 'package:lisa_flutter/src/common/stores/user_store.dart';
import 'package:lisa_flutter/src/common/utils/validator.dart';
import 'package:lisa_flutter/src/preferences/preferences_provider.dart';
import 'package:lisa_server_sdk/lisa_server_sdk.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_store.g.dart';

enum AuthMode { login, registration, noHost }

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  static const keyLastEmail = 'last_email';
  final BackendApiProvider _apiProvider;
  final SharedPreferences _preferences;
  final Validator _validator;
  final UserStore _userStore;

  @observable
  ProgressButtonState loginState = ProgressButtonState.idle;

  @observable
  AuthMode mode = AuthMode.login;

  @observable
  String email = '';

  @observable
  ErrorResult? emailError;

  String password = '';

  @observable
  ErrorResult? passwordError;

  _LoginStore({
    required UserStore userStore,
    BackendApiProvider? apiProvider,
    SharedPreferences? prefs,
    Validator? validator,
  })  : _apiProvider = apiProvider ?? BackendApiProvider(),
        _userStore = userStore,
        _validator = validator ?? Validator(),
        _preferences = prefs ?? PreferencesProvider().prefs;

  bool get hasError => emailError != null || passwordError != null;

  LisaServerSdk get _api => _apiProvider.api;

  @action
  Future init({bool resetHost = false}) async {
    if (resetHost) {
      _apiProvider.clearHost();
    }
    email = _preferences.getString(keyLastEmail) ?? email;
    try {
      final response = (await _api.getConfigApi().isInitialized()).data!;
      mode = response.initialized ? AuthMode.login : AuthMode.registration;
    } catch (err) {
      mode = AuthMode.noHost;
      print(err);
    }
  }

  @action
  Future login() async {
    if (password.isEmpty) {
      passwordError = ErrorResult.fieldRequired;
    }

    if (email.isEmpty) {
      emailError = ErrorResult.fieldRequired;
    }

    if (!_validator.isEmail(email)) {
      emailError = ErrorResult.wrongEmail;
    }

    if (hasError) {
      throw ErrorResultException(emailError ?? passwordError!);
    } else {
      try {
        loginState = ProgressButtonState.progress;
        final method = mode == AuthMode.login ? _api.getLoginApi().login : _api.getLoginApi().register;
        final response = (await method(loginRequest: (LoginRequestBuilder()
                  ..email = email
                  ..password = password)
                .build()))
            .data!;
        _preferences.setString(PreferencesProvider.keyToken, response.token);
        _preferences.setString(keyLastEmail, email);
        _api.setApiKey(kAuthKey, 'JWT ${response.token}');
        await _userStore.init();
        loginState = ProgressButtonState.done;
      } catch (error, stackTrace) {
        loginState = ProgressButtonState.idle;
        handleCaughtError(error, stackTrace);
      }
    }
  }

  @action
  Future register() async {
    if (password.isEmpty) {
      passwordError = ErrorResult.fieldRequired;
    }

    if (email.isEmpty) {
      emailError = ErrorResult.fieldRequired;
    }

    if (!_validator.isEmail(email)) {
      emailError = ErrorResult.wrongEmail;
    }

    if (hasError) {
      throw ErrorResultException(emailError ?? passwordError!); //todo generic form error ?
    } else {
      try {
        loginState = ProgressButtonState.progress;
        final response = (await _api.getLoginApi().register(loginRequest: (LoginRequestBuilder()
                  ..email = email
                  ..password = password)
                .build()))
            .data!;
        _preferences.setString(PreferencesProvider.keyToken, response.token);
        _api.setApiKey(kAuthKey, 'JWT ${response.token}');
        await _userStore.init();
        loginState = ProgressButtonState.done;
      } catch (error, stackTrace) {
        loginState = ProgressButtonState.idle;
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
