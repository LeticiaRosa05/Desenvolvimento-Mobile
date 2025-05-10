import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListsRecord extends FirestoreRecord {
  ListsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "marked" field.
  bool? _marked;
  bool get marked => _marked ?? false;
  bool hasMarked() => _marked != null;

  // "listaID" field.
  String? _listaID;
  String get listaID => _listaID ?? '';
  bool hasListaID() => _listaID != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _content = snapshotData['content'] as String?;
    _marked = snapshotData['marked'] as bool?;
    _listaID = snapshotData['listaID'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('lists');

  static Stream<ListsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ListsRecord.fromSnapshot(s));

  static Future<ListsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ListsRecord.fromSnapshot(s));

  static ListsRecord fromSnapshot(DocumentSnapshot snapshot) => ListsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ListsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ListsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ListsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ListsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createListsRecordData({
  String? title,
  DocumentReference? createdBy,
  String? content,
  bool? marked,
  String? listaID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'created_by': createdBy,
      'content': content,
      'marked': marked,
      'listaID': listaID,
    }.withoutNulls,
  );

  return firestoreData;
}

class ListsRecordDocumentEquality implements Equality<ListsRecord> {
  const ListsRecordDocumentEquality();

  @override
  bool equals(ListsRecord? e1, ListsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.createdBy == e2?.createdBy &&
        e1?.content == e2?.content &&
        e1?.marked == e2?.marked &&
        e1?.listaID == e2?.listaID;
  }

  @override
  int hash(ListsRecord? e) => const ListEquality()
      .hash([e?.title, e?.createdBy, e?.content, e?.marked, e?.listaID]);

  @override
  bool isValidKey(Object? o) => o is ListsRecord;
}
