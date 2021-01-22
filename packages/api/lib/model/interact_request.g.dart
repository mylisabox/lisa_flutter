// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'interact_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InteractRequest> _$interactRequestSerializer =
    new _$InteractRequestSerializer();

class _$InteractRequestSerializer
    implements StructuredSerializer<InteractRequest> {
  @override
  final Iterable<Type> types = const [InteractRequest, _$InteractRequest];
  @override
  final String wireName = 'InteractRequest';

  @override
  Iterable<Object> serialize(Serializers serializers, InteractRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'sentence',
      serializers.serialize(object.sentence,
          specifiedType: const FullType(String)),
      'lang',
      serializers.serialize(object.lang, specifiedType: const FullType(String)),
      'context',
      serializers.serialize(object.context,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(JsonObject)])),
    ];

    return result;
  }

  @override
  InteractRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InteractRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'sentence':
          result.sentence = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lang':
          result.lang = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'context':
          result.context.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(JsonObject)])));
          break;
      }
    }

    return result.build();
  }
}

class _$InteractRequest extends InteractRequest {
  @override
  final String sentence;
  @override
  final String lang;
  @override
  final BuiltMap<String, JsonObject> context;

  factory _$InteractRequest([void Function(InteractRequestBuilder) updates]) =>
      (new InteractRequestBuilder()..update(updates)).build();

  _$InteractRequest._({this.sentence, this.lang, this.context}) : super._() {
    if (sentence == null) {
      throw new BuiltValueNullFieldError('InteractRequest', 'sentence');
    }
    if (lang == null) {
      throw new BuiltValueNullFieldError('InteractRequest', 'lang');
    }
    if (context == null) {
      throw new BuiltValueNullFieldError('InteractRequest', 'context');
    }
  }

  @override
  InteractRequest rebuild(void Function(InteractRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InteractRequestBuilder toBuilder() =>
      new InteractRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InteractRequest &&
        sentence == other.sentence &&
        lang == other.lang &&
        context == other.context;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, sentence.hashCode), lang.hashCode), context.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InteractRequest')
          ..add('sentence', sentence)
          ..add('lang', lang)
          ..add('context', context))
        .toString();
  }
}

class InteractRequestBuilder
    implements Builder<InteractRequest, InteractRequestBuilder> {
  _$InteractRequest _$v;

  String _sentence;
  String get sentence => _$this._sentence;
  set sentence(String sentence) => _$this._sentence = sentence;

  String _lang;
  String get lang => _$this._lang;
  set lang(String lang) => _$this._lang = lang;

  MapBuilder<String, JsonObject> _context;
  MapBuilder<String, JsonObject> get context =>
      _$this._context ??= new MapBuilder<String, JsonObject>();
  set context(MapBuilder<String, JsonObject> context) =>
      _$this._context = context;

  InteractRequestBuilder() {
    InteractRequest._initializeBuilder(this);
  }

  InteractRequestBuilder get _$this {
    if (_$v != null) {
      _sentence = _$v.sentence;
      _lang = _$v.lang;
      _context = _$v.context?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InteractRequest other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InteractRequest;
  }

  @override
  void update(void Function(InteractRequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InteractRequest build() {
    _$InteractRequest _$result;
    try {
      _$result = _$v ??
          new _$InteractRequest._(
              sentence: sentence, lang: lang, context: context.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'context';
        context.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'InteractRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
