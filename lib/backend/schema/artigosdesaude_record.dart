import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'artigosdesaude_record.g.dart';

abstract class ArtigosdesaudeRecord
    implements Built<ArtigosdesaudeRecord, ArtigosdesaudeRecordBuilder> {
  static Serializer<ArtigosdesaudeRecord> get serializer =>
      _$artigosdesaudeRecordSerializer;

  @BuiltValueField(wireName: 'Nome')
  String? get nome;

  @BuiltValueField(wireName: 'Tratamentos')
  String? get tratamentos;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ArtigosdesaudeRecordBuilder builder) => builder
    ..nome = ''
    ..tratamentos = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Artigosdesaude');

  static Stream<ArtigosdesaudeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ArtigosdesaudeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ArtigosdesaudeRecord._();
  factory ArtigosdesaudeRecord(
          [void Function(ArtigosdesaudeRecordBuilder) updates]) =
      _$ArtigosdesaudeRecord;

  static ArtigosdesaudeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createArtigosdesaudeRecordData({
  String? nome,
  String? tratamentos,
}) {
  final firestoreData = serializers.toFirestore(
    ArtigosdesaudeRecord.serializer,
    ArtigosdesaudeRecord(
      (a) => a
        ..nome = nome
        ..tratamentos = tratamentos,
    ),
  );

  return firestoreData;
}
