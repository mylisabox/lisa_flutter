// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'interact_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InteractResponse> _$interactResponseSerializer =
    new _$InteractResponseSerializer();

class _$InteractResponseSerializer
    implements StructuredSerializer<InteractResponse> {
  @override
  final Iterable<Type> types = const [InteractResponse, _$InteractResponse];
  @override
  final String wireName = 'InteractResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, InteractResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'action',
      serializers.serialize(object.action,
          specifiedType: const FullType(String)),
      'lang',
      serializers.serialize(object.lang, specifiedType: const FullType(String)),
      'userId',
      serializers.serialize(object.userId, specifiedType: const FullType(int)),
      'userSentence',
      serializers.serialize(object.userSentence,
          specifiedType: const FullType(String)),
      'response',
      serializers.serialize(object.response,
          specifiedType: const FullType(String)),
      'responses',
      serializers.serialize(object.responses,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  InteractResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InteractResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'action':
          result.action = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lang':
          result.lang = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'userSentence':
          result.userSentence = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'response':
          result.response = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'responses':
          result.responses.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

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
          [void Function(InteractResponseBuilder) updates]) =>
      (new InteractResponseBuilder()..update(updates)).build();

  _$InteractResponse._(
      {this.action,
      this.lang,
      this.userId,
      this.userSentence,
      this.response,
      this.responses})
      : super._() {
    if (action == null) {
      throw new BuiltValueNullFieldError('InteractResponse', 'action');
    }
    if (lang == null) {
      throw new BuiltValueNullFieldError('InteractResponse', 'lang');
    }
    if (userId == null) {
      throw new BuiltValueNullFieldError('InteractResponse', 'userId');
    }
    if (userSentence == null) {
      throw new BuiltValueNullFieldError('InteractResponse', 'userSentence');
    }
    if (response == null) {
      throw new BuiltValueNullFieldError('InteractResponse', 'response');
    }
    if (responses == null) {
      throw new BuiltValueNullFieldError('InteractResponse', 'responses');
    }
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
  _$InteractResponse _$v;

  String _action;
  String get action => _$this._action;
  set action(String action) => _$this._action = action;

  String _lang;
  String get lang => _$this._lang;
  set lang(String lang) => _$this._lang = lang;

  int _userId;
  int get userId => _$this._userId;
  set userId(int userId) => _$this._userId = userId;

  String _userSentence;
  String get userSentence => _$this._userSentence;
  set userSentence(String userSentence) => _$this._userSentence = userSentence;

  String _response;
  String get response => _$this._response;
  set response(String response) => _$this._response = response;

  ListBuilder<String> _responses;
  ListBuilder<String> get responses =>
      _$this._responses ??= new ListBuilder<String>();
  set responses(ListBuilder<String> responses) => _$this._responses = responses;

  InteractResponseBuilder() {
    InteractResponse._initializeBuilder(this);
  }

  InteractResponseBuilder get _$this {
    if (_$v != null) {
      _action = _$v.action;
      _lang = _$v.lang;
      _userId = _$v.userId;
      _userSentence = _$v.userSentence;
      _response = _$v.response;
      _responses = _$v.responses?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InteractResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InteractResponse;
  }

  @override
  void update(void Function(InteractResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InteractResponse build() {
    _$InteractResponse _$result;
    try {
      _$result = _$v ??
          new _$InteractResponse._(
              action: action,
              lang: lang,
              userId: userId,
              userSentence: userSentence,
              response: response,
              responses: responses.build());
    } catch (_) {
      String _$failedField;
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
