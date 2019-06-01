class Validator {
  static final RegExp _emailRegExp = RegExp(
    '^([0-9a-zA-Z]([-.+\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,9})\$',
    caseSensitive: false,
    multiLine: false,
  );

  static final RegExp _phoneRegExp = RegExp(
    '^\\+?[- ().0-9]{7,}\$',
    caseSensitive: false,
    multiLine: false,
  );

  bool isEmail(String value) {
    return _emailRegExp.hasMatch(value);
  }

  bool isPhone(String value) {
    return _phoneRegExp.hasMatch(value);
  }
}
