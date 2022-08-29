import 'package:dio/dio.dart';
import 'package:lisa_flutter/src/common/errors.dart';
import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:lisa_flutter/src/common/presentation/loading_button.dart';
import 'package:lisa_flutter/src/common/stores/user_store.dart';
import 'package:lisa_flutter/src/common/utils/validator.dart';
import 'package:lisa_flutter/src/preferences/preferences_provider.dart';
import 'package:lisa_server_sdk/lisa_server_sdk.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  ErrorResult? email;

  @observable
  ErrorResult? password;

  @observable
  ErrorResult? lastName;

  @observable
  ErrorResult? firstName;

  @computed
  bool get hasErrors => lastName != null || firstName != null || email != null || password != null;
}

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  static const keyLastEmail = 'last_email';
  final BackendApiProvider _apiProvider;
  final PreferencesProvider _preferencesProvider;
  final Validator _validator;
  final UserStore _userStore;
  final FormErrorState errorState = FormErrorState();

  @observable
  ProgressButtonState loginState = ProgressButtonState.idle;

  @observable
  String email = '';

  @observable
  String lastName = '';

  @observable
  String firstName = '';

  @observable
  String password = '';

  @observable
  String lang = 'en';

  late List<ReactionDisposer> _disposers;

  _LoginStore({
    required UserStore userStore,
    BackendApiProvider? apiProvider,
    PreferencesProvider? prefs,
    Validator? validator,
  })  : _apiProvider = apiProvider ?? BackendApiProvider(),
        _userStore = userStore,
        _validator = validator ?? Validator(),
        _preferencesProvider = prefs ?? PreferencesProvider();

  bool get hasErrors => _userStore.serverStatus == ServerStatus.initialized ? errorState.email != null || errorState.password != null : errorState.hasErrors;

  LisaServerSdk get _api => _apiProvider.api;

  @action
  Future init({bool resetHost = false}) async {
    if (resetHost) {
      _apiProvider.clearHost();
    }
    email = _preferencesProvider.prefs.getString(keyLastEmail) ?? email;
    await _userStore.init();
  }

  void setupValidations() {
    _disposers = [
      reaction((_) => lastName, _validateLastName),
      reaction((_) => firstName, _validateFirstName),
      reaction((_) => email, _validateEmail),
      reaction((_) => password, _validatePassword)
    ];
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void _validateEmail(String email) {
    if (email.isEmpty) {
      errorState.email = ErrorResult.fieldRequired;
    }
    if (!_validator.isEmail(email)) {
      errorState.email = ErrorResult.wrongEmail;
    }
  }

  void _validatePassword(String password) {
    if (password.isEmpty) {
      errorState.password = ErrorResult.fieldRequired;
    }
  }

  void _validateLastName(String name) {
    if (name.isEmpty) {
      errorState.lastName = ErrorResult.fieldRequired;
    }
  }

  void _validateFirstName(String name) {
    if (name.isEmpty) {
      errorState.firstName = ErrorResult.fieldRequired;
    }
  }

  void _validateForm() {
    _validatePassword(password);
    _validateEmail(email);
    if (_userStore.serverStatus == ServerStatus.uninitialized) {
      _validateLastName(lastName);
      _validateFirstName(firstName);
    }
  }

  @action
  Future login() async {
    if (_userStore.serverStatus == ServerStatus.uninitialized) {
      return register();
    }

    _validateForm();
    if (hasErrors) {
      loginState = ProgressButtonState.idle;
      throw StateError('Form has errors');
    } else {
      try {
        loginState = ProgressButtonState.progress;
        final response = (await _api.getAuthApi().login(
                loginRequest: (LoginRequestBuilder()
                      ..email = email
                      ..password = password)
                    .build()))
            .data!;
        await _preferencesProvider.prefs.setString(keyLastEmail, email);
        await _manageAuthResponse(response);
        loginState = ProgressButtonState.done;
      } catch (error, stackTrace) {
        loginState = ProgressButtonState.idle;
        if (error is DioError && error.response?.statusCode == 401) {
          throw ErrorResultException(ErrorResult.wrongCredentials);
        } else {
          handleCaughtError(error, stackTrace);
        }
      }
    }
  }

  @action
  Future register() async {
    _validateForm();

    if (hasErrors) {
      loginState = ProgressButtonState.idle;
      throw StateError('Form has errors');
    } else {
      try {
        loginState = ProgressButtonState.progress;
        final response = (await _api.getAuthApi().register(
                userUpdate: (UserUpdateBuilder()
                      ..email = email
                      ..password = password
                      ..lastName = lastName
                      ..lang = lang
                      ..firstName = firstName)
                    .build()))
            .data!;
        await _preferencesProvider.prefs.setString(keyLastEmail, email);
        await _manageAuthResponse(response);
        loginState = ProgressButtonState.done;
      } catch (error, stackTrace) {
        loginState = ProgressButtonState.idle;
        handleCaughtError(error, stackTrace);
      }
    }
  }

  Future<void> _manageAuthResponse(LoginResponse response) async {
    _preferencesProvider.securePrefs.write(key: PreferencesProvider.keyToken, value: response.token);
    _preferencesProvider.securePrefs.write(key: PreferencesProvider.keyRefreshToken, value: response.refreshToken);
    _apiProvider.setToken(response.token);
    await _userStore.init();
  }

  @action
  void setEmail(String email) {
    errorState.email = null;
    this.email = email;
  }

  @action
  void setPassword(String password) {
    errorState.password = null;
    this.password = password;
  }

  @action
  void setLastName(String lastName) {
    errorState.lastName = null;
    this.lastName = lastName;
  }

  @action
  void setFirstName(String firstName) {
    errorState.firstName = null;
    this.firstName = firstName;
  }
}
