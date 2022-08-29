import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/l10n/error_localizations.dart';

FutureOr<dynamic> handleCaughtError(error, stackTrace) {
  throw handleError(error, stackTrace);
}

ErrorResultException handleError(error, stackTrace) {
  if (error is ErrorResultException) {
    return error;
  } else {
    var result = ErrorResultException(ErrorResult.internal);
    final isDioTimeout = (error is DioError &&
        (error.type == DioErrorType.connectTimeout || error.type == DioErrorType.receiveTimeout || error.type == DioErrorType.sendTimeout));
    if (error is TimeoutException || isDioTimeout) {
      result = ErrorResultException(ErrorResult.noNetwork);
    } else if (error is DioError && error.response?.statusCode == 401) {
      result = ErrorResultException(ErrorResult.notLogged);
    } else if (error is DioError && error.response?.statusCode == 403) {
      result = ErrorResultException(ErrorResult.forbidden);
    }
    kDebugLogger.severe('handleError: Future error from $error forwarded to $result', error, stackTrace);
    return result;
  }
}

class ErrorResultException implements Exception {
  final ErrorResult cause;

  ErrorResultException(this.cause);

  @override
  bool operator ==(Object other) => identical(this, other) || other is ErrorResultException && runtimeType == other.runtimeType && cause == other.cause;

  @override
  int get hashCode => cause.hashCode;

  @override
  String toString() {
    return 'ErrorResultException{cause: $cause}';
  }
}

class ErrorResult {
  static const noNetwork = ErrorResult(_ErrorType.noNetwork);
  static const wrongEmail = ErrorResult(_ErrorType.wrongEmail);
  static const notLogged = ErrorResult(_ErrorType.notLogged);
  static const forbidden = ErrorResult(_ErrorType.forbidden);
  static const wrongCredentials = ErrorResult(_ErrorType.wrongCredentials);

  // generic
  static const internal = ErrorResult(_ErrorType.internal);
  static const noAppForActionError = ErrorResult(_ErrorType.noAppForActionError);
  static const fieldRequired = ErrorResult(_ErrorType.fieldRequired);

  final _ErrorType _type;

  const ErrorResult(this._type);

  String getMessage(BuildContext context) {
    final localizations = ErrorLocalizations.of(context);
    switch (_type) {
      case _ErrorType.wrongEmail:
        return localizations.wrongEmailMessage;
      case _ErrorType.noNetwork:
        return localizations.noNetworkMessage;

      // generic
      case _ErrorType.internal:
        return localizations.internalMessage;
      case _ErrorType.noAppForActionError:
        return localizations.noAppForTheAction;
      case _ErrorType.fieldRequired:
        return localizations.fieldRequired;
      case _ErrorType.notLogged:
        return localizations.notLogged;
      case _ErrorType.forbidden:
        return localizations.forbidden;
      case _ErrorType.wrongCredentials:
        return localizations.wrongCredentials;
    }
  }

  String twoLiner(BuildContext context) {
    return '${getMessage(context)}\n${getHint(context)}';
  }

  String getHint(BuildContext context) {
    final localizations = ErrorLocalizations.of(context);
    switch (_type) {
      case _ErrorType.wrongEmail:
        return '';
      case _ErrorType.noNetwork:
        return localizations.noNetworkHint;
      // generic
      case _ErrorType.internal:
        return localizations.internalHint;
      case _ErrorType.noAppForActionError:
        return localizations.noAppForTheActionHint;
      case _ErrorType.fieldRequired:
        return localizations.fieldRequiredHint;
      case _ErrorType.notLogged:
        return localizations.notLoggedHint;
      case _ErrorType.forbidden:
        return localizations.forbiddenHint;
      case _ErrorType.wrongCredentials:
        return localizations.wrongCredentialsHint;
    }
  }

  @override
  bool operator ==(Object other) => identical(this, other) || other is ErrorResult && runtimeType == other.runtimeType && _type == other._type;

  @override
  int get hashCode => _type.hashCode;

  @override
  String toString() {
    return 'ErrorResult{$_type}';
  }
}

enum _ErrorType {
  noNetwork,
  notLogged,
  forbidden,
  wrongCredentials,
  internal,
  wrongEmail,
  fieldRequired,
  noAppForActionError,
}
