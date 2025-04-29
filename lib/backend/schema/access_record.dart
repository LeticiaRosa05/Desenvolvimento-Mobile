import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AccessRecord extends FirestoreRecord {
  AccessRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "lista" field.
  String? _lista;
  String get lista => _lista ?? '';
  bool hasLista() => _lista != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _username = snapshotData['username'] as String?;
    _lista = snapshotData['lista'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('access');

  static Stream<AccessRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AccessRecord.fromSnapshot(s));

  static Future<AccessRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AccessRecord.fromSnapshot(s));

  static AccessRecord fromSnapshot(DocumentSnapshot snapshot) => AccessRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AccessRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AccessRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AccessRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AccessRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAccessRecordData({
  String? email,
  String? username,
  String? lista,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'username': username,
      'lista': lista,
    }.withoutNulls,
  );

  return firestoreData;
}

class AccessRecordDocumentEquality implements Equality<AccessRecord> {
  const AccessRecordDocumentEquality();

  @override
  bool equals(AccessRecord? e1, AccessRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.username == e2?.username &&
        e1?.lista == e2?.lista;
  }

  @override
  int hash(AccessRecord? e) =>
      const ListEquality().hash([e?.email, e?.username, e?.lista]);

  @override
  bool isValidKey(Object? o) => o is AccessRecord;
}
