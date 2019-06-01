import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/l10n/error_localizations.dart';

Future handleCaughtError(error, stackTrace) {
  throw handleError(error, stackTrace);
}

ErrorResultException handleError(error, stackTrace) {
  if (error is ErrorResultException) {
    return error;
  } else {
    var result = ErrorResultException(ErrorResult.internal);
    if (error is TimeoutException || error is SocketException) {
      result = ErrorResultException(ErrorResult.noNetwork);
    }
    kDebugLogger.severe('Future error from $error forwarded to $result', error, stackTrace);
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

    }
    return null;
  }

  String twoLiner(BuildContext context) {
    return '${getMessage(context)}\n${getHint(context) ?? ''}';
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

    }
    return null;
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
  internal,
  wrongEmail,
  fieldRequired,
  noAppForActionError,
}
