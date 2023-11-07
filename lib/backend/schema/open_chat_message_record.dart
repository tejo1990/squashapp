import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OpenChatMessageRecord extends FirestoreRecord {
  OpenChatMessageRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "openchat" field.
  DocumentReference? _openchat;
  DocumentReference? get openchat => _openchat;
  bool hasOpenchat() => _openchat != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _openchat = snapshotData['openchat'] as DocumentReference?;
    _text = snapshotData['text'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('open_chat_message');

  static Stream<OpenChatMessageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OpenChatMessageRecord.fromSnapshot(s));

  static Future<OpenChatMessageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OpenChatMessageRecord.fromSnapshot(s));

  static OpenChatMessageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OpenChatMessageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OpenChatMessageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OpenChatMessageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OpenChatMessageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OpenChatMessageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOpenChatMessageRecordData({
  DocumentReference? user,
  DocumentReference? openchat,
  String? text,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'openchat': openchat,
      'text': text,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class OpenChatMessageRecordDocumentEquality
    implements Equality<OpenChatMessageRecord> {
  const OpenChatMessageRecordDocumentEquality();

  @override
  bool equals(OpenChatMessageRecord? e1, OpenChatMessageRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.openchat == e2?.openchat &&
        e1?.text == e2?.text &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(OpenChatMessageRecord? e) =>
      const ListEquality().hash([e?.user, e?.openchat, e?.text, e?.timestamp]);

  @override
  bool isValidKey(Object? o) => o is OpenChatMessageRecord;
}
