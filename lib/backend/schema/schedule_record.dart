import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScheduleRecord extends FirestoreRecord {
  ScheduleRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "contents" field.
  String? _contents;
  String get contents => _contents ?? '';
  bool hasContents() => _contents != null;

  // "startTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "endTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _contents = snapshotData['contents'] as String?;
    _startTime = snapshotData['startTime'] as DateTime?;
    _endTime = snapshotData['endTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Schedule');

  static Stream<ScheduleRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ScheduleRecord.fromSnapshot(s));

  static Future<ScheduleRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ScheduleRecord.fromSnapshot(s));

  static ScheduleRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ScheduleRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ScheduleRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ScheduleRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ScheduleRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ScheduleRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createScheduleRecordData({
  DateTime? date,
  String? contents,
  DateTime? startTime,
  DateTime? endTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'contents': contents,
      'startTime': startTime,
      'endTime': endTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class ScheduleRecordDocumentEquality implements Equality<ScheduleRecord> {
  const ScheduleRecordDocumentEquality();

  @override
  bool equals(ScheduleRecord? e1, ScheduleRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.contents == e2?.contents &&
        e1?.startTime == e2?.startTime &&
        e1?.endTime == e2?.endTime;
  }

  @override
  int hash(ScheduleRecord? e) => const ListEquality()
      .hash([e?.date, e?.contents, e?.startTime, e?.endTime]);

  @override
  bool isValidKey(Object? o) => o is ScheduleRecord;
}
