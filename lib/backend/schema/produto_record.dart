import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProdutoRecord extends FirestoreRecord {
  ProdutoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "comprado" field.
  bool? _comprado;
  bool get comprado => _comprado ?? false;
  bool hasComprado() => _comprado != null;

  // "valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  bool hasValor() => _valor != null;

  // "quantidade" field.
  int? _quantidade;
  int get quantidade => _quantidade ?? 0;
  bool hasQuantidade() => _quantidade != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  void _initializeFields() {
    _comprado = snapshotData['comprado'] as bool?;
    _valor = castToType<double>(snapshotData['valor']);
    _quantidade = castToType<int>(snapshotData['quantidade']);
    _nome = snapshotData['nome'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('produto');

  static Stream<ProdutoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProdutoRecord.fromSnapshot(s));

  static Future<ProdutoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProdutoRecord.fromSnapshot(s));

  static ProdutoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProdutoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProdutoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProdutoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProdutoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProdutoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProdutoRecordData({
  bool? comprado,
  double? valor,
  int? quantidade,
  String? nome,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comprado': comprado,
      'valor': valor,
      'quantidade': quantidade,
      'nome': nome,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProdutoRecordDocumentEquality implements Equality<ProdutoRecord> {
  const ProdutoRecordDocumentEquality();

  @override
  bool equals(ProdutoRecord? e1, ProdutoRecord? e2) {
    return e1?.comprado == e2?.comprado &&
        e1?.valor == e2?.valor &&
        e1?.quantidade == e2?.quantidade &&
        e1?.nome == e2?.nome;
  }

  @override
  int hash(ProdutoRecord? e) => const ListEquality()
      .hash([e?.comprado, e?.valor, e?.quantidade, e?.nome]);

  @override
  bool isValidKey(Object? o) => o is ProdutoRecord;
}
