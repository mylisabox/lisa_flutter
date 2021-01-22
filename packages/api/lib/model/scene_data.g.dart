// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'scene_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SceneData> _$sceneDataSerializer = new _$SceneDataSerializer();

class _$SceneDataSerializer implements StructuredSerializer<SceneData> {
  @override
  final Iterable<Type> types = const [SceneData, _$SceneData];
  @override
  final String wireName = 'SceneData';

  @override
  Iterable<Object> serialize(Serializers serializers, SceneData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'sentences',
      serializers.serialize(object.sentences,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'responses',
      serializers.serialize(object.responses,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'commands',
      serializers.serialize(object.commands,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  SceneData deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SceneDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'sentences':
          result.sentences.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'responses':
          result.responses.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'commands':
          result.commands.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$SceneData extends SceneData {
  @override
  final BuiltList<String> sentences;
  @override
  final BuiltList<String> responses;
  @override
  final BuiltList<String> commands;

  factory _$SceneData([void Function(SceneDataBuilder) updates]) =>
      (new SceneDataBuilder()..update(updates)).build();

  _$SceneData._({this.sentences, this.responses, this.commands}) : super._() {
    if (sentences == null) {
      throw new BuiltValueNullFieldError('SceneData', 'sentences');
    }
    if (responses == null) {
      throw new BuiltValueNullFieldError('SceneData', 'responses');
    }
    if (commands == null) {
      throw new BuiltValueNullFieldError('SceneData', 'commands');
    }
  }

  @override
  SceneData rebuild(void Function(SceneDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SceneDataBuilder toBuilder() => new SceneDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SceneData &&
        sentences == other.sentences &&
        responses == other.responses &&
        commands == other.commands;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, sentences.hashCode), responses.hashCode),
        commands.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SceneData')
          ..add('sentences', sentences)
          ..add('responses', responses)
          ..add('commands', commands))
        .toString();
  }
}

class SceneDataBuilder implements Builder<SceneData, SceneDataBuilder> {
  _$SceneData _$v;

  ListBuilder<String> _sentences;
  ListBuilder<String> get sentences =>
      _$this._sentences ??= new ListBuilder<String>();
  set sentences(ListBuilder<String> sentences) => _$this._sentences = sentences;

  ListBuilder<String> _responses;
  ListBuilder<String> get responses =>
      _$this._responses ??= new ListBuilder<String>();
  set responses(ListBuilder<String> responses) => _$this._responses = responses;

  ListBuilder<String> _commands;
  ListBuilder<String> get commands =>
      _$this._commands ??= new ListBuilder<String>();
  set commands(ListBuilder<String> commands) => _$this._commands = commands;

  SceneDataBuilder() {
    SceneData._initializeBuilder(this);
  }

  SceneDataBuilder get _$this {
    if (_$v != null) {
      _sentences = _$v.sentences?.toBuilder();
      _responses = _$v.responses?.toBuilder();
      _commands = _$v.commands?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SceneData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SceneData;
  }

  @override
  void update(void Function(SceneDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SceneData build() {
    _$SceneData _$result;
    try {
      _$result = _$v ??
          new _$SceneData._(
              sentences: sentences.build(),
              responses: responses.build(),
              commands: commands.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'sentences';
        sentences.build();
        _$failedField = 'responses';
        responses.build();
        _$failedField = 'commands';
        commands.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SceneData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
