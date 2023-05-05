// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artigosdesaude_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ArtigosdesaudeRecord> _$artigosdesaudeRecordSerializer =
    new _$ArtigosdesaudeRecordSerializer();

class _$ArtigosdesaudeRecordSerializer
    implements StructuredSerializer<ArtigosdesaudeRecord> {
  @override
  final Iterable<Type> types = const [
    ArtigosdesaudeRecord,
    _$ArtigosdesaudeRecord
  ];
  @override
  final String wireName = 'ArtigosdesaudeRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ArtigosdesaudeRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.nome;
    if (value != null) {
      result
        ..add('Nome')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tratamentos;
    if (value != null) {
      result
        ..add('Tratamentos')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  ArtigosdesaudeRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ArtigosdesaudeRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Nome':
          result.nome = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Tratamentos':
          result.tratamentos = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$ArtigosdesaudeRecord extends ArtigosdesaudeRecord {
  @override
  final String? nome;
  @override
  final String? tratamentos;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ArtigosdesaudeRecord(
          [void Function(ArtigosdesaudeRecordBuilder)? updates]) =>
      (new ArtigosdesaudeRecordBuilder()..update(updates))._build();

  _$ArtigosdesaudeRecord._({this.nome, this.tratamentos, this.ffRef})
      : super._();

  @override
  ArtigosdesaudeRecord rebuild(
          void Function(ArtigosdesaudeRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArtigosdesaudeRecordBuilder toBuilder() =>
      new ArtigosdesaudeRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ArtigosdesaudeRecord &&
        nome == other.nome &&
        tratamentos == other.tratamentos &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, nome.hashCode);
    _$hash = $jc(_$hash, tratamentos.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ArtigosdesaudeRecord')
          ..add('nome', nome)
          ..add('tratamentos', tratamentos)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ArtigosdesaudeRecordBuilder
    implements Builder<ArtigosdesaudeRecord, ArtigosdesaudeRecordBuilder> {
  _$ArtigosdesaudeRecord? _$v;

  String? _nome;
  String? get nome => _$this._nome;
  set nome(String? nome) => _$this._nome = nome;

  String? _tratamentos;
  String? get tratamentos => _$this._tratamentos;
  set tratamentos(String? tratamentos) => _$this._tratamentos = tratamentos;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ArtigosdesaudeRecordBuilder() {
    ArtigosdesaudeRecord._initializeBuilder(this);
  }

  ArtigosdesaudeRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nome = $v.nome;
      _tratamentos = $v.tratamentos;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ArtigosdesaudeRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ArtigosdesaudeRecord;
  }

  @override
  void update(void Function(ArtigosdesaudeRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ArtigosdesaudeRecord build() => _build();

  _$ArtigosdesaudeRecord _build() {
    final _$result = _$v ??
        new _$ArtigosdesaudeRecord._(
            nome: nome, tratamentos: tratamentos, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
