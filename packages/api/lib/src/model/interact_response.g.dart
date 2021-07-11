// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interact_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InteractResponse extends InteractResponse {
  @override
  final String action;
  @override
  final String lang;
  @override
  final int userId;
  @override
  final String userSentence;
  @override
  final String response;
  @override
  final BuiltList<String> responses;

  factory _$InteractResponse(
          [void Function(InteractResponseBuilder)? updates]) =>
      (new InteractResponseBuilder()..update(updates)).build();

  _$InteractResponse._(
      {required this.action,
      required this.lang,
      required this.userId,
      required this.userSentence,
      required this.response,
      required this.responses})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(action, 'InteractResponse', 'action');
    BuiltValueNullFieldError.checkNotNull(lang, 'InteractResponse', 'lang');
    BuiltValueNullFieldError.checkNotNull(userId, 'InteractResponse', 'userId');
    BuiltValueNullFieldError.checkNotNull(
        userSentence, 'InteractResponse', 'userSentence');
    BuiltValueNullFieldError.checkNotNull(
        response, 'InteractResponse', 'response');
    BuiltValueNullFieldError.checkNotNull(
        responses, 'InteractResponse', 'responses');
  }

  @override
  InteractResponse rebuild(void Function(InteractResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InteractResponseBuilder toBuilder() =>
      new InteractResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InteractResponse &&
        action == other.action &&
        lang == other.lang &&
        userId == other.userId &&
        userSentence == other.userSentence &&
        response == other.response &&
        responses == other.responses;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, action.hashCode), lang.hashCode),
                    userId.hashCode),
                userSentence.hashCode),
            response.hashCode),
        responses.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InteractResponse')
          ..add('action', action)
          ..add('lang', lang)
          ..add('userId', userId)
          ..add('userSentence', userSentence)
          ..add('response', response)
          ..add('responses', responses))
        .toString();
  }
}

class InteractResponseBuilder
    implements Builder<InteractResponse, InteractResponseBuilder> {
  _$InteractResponse? _$v;

  String? _action;
  String? get action => _$this._action;
  set action(String? action) => _$this._action = action;

  String? _lang;
  String? get lang => _$this._lang;
  set lang(String? lang) => _$this._lang = lang;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  String? _userSentence;
  String? get userSentence => _$this._userSentence;
  set userSentence(String? userSentence) => _$this._userSentence = userSentence;

  String? _response;
  String? get response => _$this._response;
  set response(String? response) => _$this._response = response;

  ListBuilder<String>? _responses;
  ListBuilder<String> get responses =>
      _$this._responses ??= new ListBuilder<String>();
  set responses(ListBuilder<String>? responses) =>
      _$this._responses = responses;

  InteractResponseBuilder() {
    InteractResponse._initializeBuilder(this);
  }

  InteractResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _action = $v.action;
      _lang = $v.lang;
      _userId = $v.userId;
      _userSentence = $v.userSentence;
      _response = $v.response;
      _responses = $v.responses.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InteractResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InteractResponse;
  }

  @override
  void update(void Function(InteractResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InteractResponse build() {
    _$InteractResponse _$result;
    try {
      _$result = _$v ??
          new _$InteractResponse._(
              action: BuiltValueNullFieldError.checkNotNull(
                  action, 'InteractResponse', 'action'),
              lang: BuiltValueNullFieldError.checkNotNull(
                  lang, 'InteractResponse', 'lang'),
              userId: BuiltValueNullFieldError.checkNotNull(
                  userId, 'InteractResponse', 'userId'),
              userSentence: BuiltValueNullFieldError.checkNotNull(
                  userSentence, 'InteractResponse', 'userSentence'),
              response: BuiltValueNullFieldError.checkNotNull(
                  response, 'InteractResponse', 'response'),
              responses: responses.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'responses';
        responses.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'InteractResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
