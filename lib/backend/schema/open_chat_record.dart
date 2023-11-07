import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OpenChatRecord extends FirestoreRecord {
  OpenChatRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "openchat_name" field.
  String? _openchatName;
  String get openchatName => _openchatName ?? '';
  bool hasOpenchatName() => _openchatName != null;

  // "last_message" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "last_message_time" field.
  DateTime? _lastMessageTime;
  DateTime? get lastMessageTime => _lastMessageTime;
  bool hasLastMessageTime() => _lastMessageTime != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _openchatName = snapshotData['openchat_name'] as String?;
    _lastMessage = snapshotData['last_message'] as String?;
    _lastMessageTime = snapshotData['last_message_time'] as DateTime?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('open_chat');

  static Stream<OpenChatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OpenChatRecord.fromSnapshot(s));

  static Future<OpenChatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OpenChatRecord.fromSnapshot(s));

  static OpenChatRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OpenChatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OpenChatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OpenChatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OpenChatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OpenChatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOpenChatRecordData({
  String? openchatName,
  String? lastMessage,
  DateTime? lastMessageTime,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'openchat_name': openchatName,
      'last_message': lastMessage,
      'last_message_time': lastMessageTime,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class OpenChatRecordDocumentEquality implements Equality<OpenChatRecord> {
  const OpenChatRecordDocumentEquality();

  @override
  bool equals(OpenChatRecord? e1, OpenChatRecord? e2) {
    return e1?.openchatName == e2?.openchatName &&
        e1?.lastMessage == e2?.lastMessage &&
        e1?.lastMessageTime == e2?.lastMessageTime &&
        e1?.image == e2?.image;
  }

  @override
  int hash(OpenChatRecord? e) => const ListEquality()
      .hash([e?.openchatName, e?.lastMessage, e?.lastMessageTime, e?.image]);

  @override
  bool isValidKey(Object? o) => o is OpenChatRecord;
}
