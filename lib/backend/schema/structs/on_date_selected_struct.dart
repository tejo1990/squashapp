// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OnDateSelectedStruct extends FFFirebaseStruct {
  OnDateSelectedStruct({
    DateTime? selectedDate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _selectedDate = selectedDate,
        super(firestoreUtilData);

  // "selectedDate" field.
  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? val) => _selectedDate = val;
  bool hasSelectedDate() => _selectedDate != null;

  static OnDateSelectedStruct fromMap(Map<String, dynamic> data) =>
      OnDateSelectedStruct(
        selectedDate: data['selectedDate'] as DateTime?,
      );

  static OnDateSelectedStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? OnDateSelectedStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'selectedDate': _selectedDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'selectedDate': serializeParam(
          _selectedDate,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static OnDateSelectedStruct fromSerializableMap(Map<String, dynamic> data) =>
      OnDateSelectedStruct(
        selectedDate: deserializeParam(
          data['selectedDate'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'OnDateSelectedStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OnDateSelectedStruct && selectedDate == other.selectedDate;
  }

  @override
  int get hashCode => const ListEquality().hash([selectedDate]);
}

OnDateSelectedStruct createOnDateSelectedStruct({
  DateTime? selectedDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OnDateSelectedStruct(
      selectedDate: selectedDate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OnDateSelectedStruct? updateOnDateSelectedStruct(
  OnDateSelectedStruct? onDateSelected, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    onDateSelected
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOnDateSelectedStructData(
  Map<String, dynamic> firestoreData,
  OnDateSelectedStruct? onDateSelected,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (onDateSelected == null) {
    return;
  }
  if (onDateSelected.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && onDateSelected.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final onDateSelectedData =
      getOnDateSelectedFirestoreData(onDateSelected, forFieldValue);
  final nestedData =
      onDateSelectedData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = onDateSelected.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOnDateSelectedFirestoreData(
  OnDateSelectedStruct? onDateSelected, [
  bool forFieldValue = false,
]) {
  if (onDateSelected == null) {
    return {};
  }
  final firestoreData = mapToFirestore(onDateSelected.toMap());

  // Add any Firestore field values
  onDateSelected.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOnDateSelectedListFirestoreData(
  List<OnDateSelectedStruct>? onDateSelecteds,
) =>
    onDateSelecteds
        ?.map((e) => getOnDateSelectedFirestoreData(e, true))
        .toList() ??
    [];
