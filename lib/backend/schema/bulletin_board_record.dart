import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BulletinBoardRecord extends FirestoreRecord {
  BulletinBoardRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "notice_contents" field.
  String? _noticeContents;
  String get noticeContents => _noticeContents ?? '';
  bool hasNoticeContents() => _noticeContents != null;

  // "bulletedTime" field.
  DateTime? _bulletedTime;
  DateTime? get bulletedTime => _bulletedTime;
  bool hasBulletedTime() => _bulletedTime != null;

  // "bulletedUser" field.
  DocumentReference? _bulletedUser;
  DocumentReference? get bulletedUser => _bulletedUser;
  bool hasBulletedUser() => _bulletedUser != null;

  void _initializeFields() {
    _noticeContents = snapshotData['notice_contents'] as String?;
    _bulletedTime = snapshotData['bulletedTime'] as DateTime?;
    _bulletedUser = snapshotData['bulletedUser'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bulletinBoard');

  static Stream<BulletinBoardRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BulletinBoardRecord.fromSnapshot(s));

  static Future<BulletinBoardRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BulletinBoardRecord.fromSnapshot(s));

  static BulletinBoardRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BulletinBoardRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BulletinBoardRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BulletinBoardRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BulletinBoardRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BulletinBoardRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBulletinBoardRecordData({
  String? noticeContents,
  DateTime? bulletedTime,
  DocumentReference? bulletedUser,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'notice_contents': noticeContents,
      'bulletedTime': bulletedTime,
      'bulletedUser': bulletedUser,
    }.withoutNulls,
  );

  return firestoreData;
}

class BulletinBoardRecordDocumentEquality
    implements Equality<BulletinBoardRecord> {
  const BulletinBoardRecordDocumentEquality();

  @override
  bool equals(BulletinBoardRecord? e1, BulletinBoardRecord? e2) {
    return e1?.noticeContents == e2?.noticeContents &&
        e1?.bulletedTime == e2?.bulletedTime &&
        e1?.bulletedUser == e2?.bulletedUser;
  }

  @override
  int hash(BulletinBoardRecord? e) => const ListEquality()
      .hash([e?.noticeContents, e?.bulletedTime, e?.bulletedUser]);

  @override
  bool isValidKey(Object? o) => o is BulletinBoardRecord;
}
