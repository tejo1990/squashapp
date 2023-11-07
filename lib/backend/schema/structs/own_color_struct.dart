// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OwnColorStruct extends FFFirebaseStruct {
  OwnColorStruct({
    Color? colorSelected,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _colorSelected = colorSelected,
        super(firestoreUtilData);

  // "colorSelected" field.
  Color? _colorSelected;
  Color? get colorSelected => _colorSelected;
  set colorSelected(Color? val) => _colorSelected = val;
  bool hasColorSelected() => _colorSelected != null;

  static OwnColorStruct fromMap(Map<String, dynamic> data) => OwnColorStruct(
        colorSelected: getSchemaColor(data['colorSelected']),
      );

  static OwnColorStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? OwnColorStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'colorSelected': _colorSelected,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'colorSelected': serializeParam(
          _colorSelected,
          ParamType.Color,
        ),
      }.withoutNulls;

  static OwnColorStruct fromSerializableMap(Map<String, dynamic> data) =>
      OwnColorStruct(
        colorSelected: deserializeParam(
          data['colorSelected'],
          ParamType.Color,
          false,
        ),
      );

  @override
  String toString() => 'OwnColorStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OwnColorStruct && colorSelected == other.colorSelected;
  }

  @override
  int get hashCode => const ListEquality().hash([colorSelected]);
}

OwnColorStruct createOwnColorStruct({
  Color? colorSelected,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OwnColorStruct(
      colorSelected: colorSelected,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OwnColorStruct? updateOwnColorStruct(
  OwnColorStruct? ownColor, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    ownColor
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOwnColorStructData(
  Map<String, dynamic> firestoreData,
  OwnColorStruct? ownColor,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (ownColor == null) {
    return;
  }
  if (ownColor.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && ownColor.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final ownColorData = getOwnColorFirestoreData(ownColor, forFieldValue);
  final nestedData = ownColorData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = ownColor.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOwnColorFirestoreData(
  OwnColorStruct? ownColor, [
  bool forFieldValue = false,
]) {
  if (ownColor == null) {
    return {};
  }
  final firestoreData = mapToFirestore(ownColor.toMap());

  // Add any Firestore field values
  ownColor.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOwnColorListFirestoreData(
  List<OwnColorStruct>? ownColors,
) =>
    ownColors?.map((e) => getOwnColorFirestoreData(e, true)).toList() ?? [];
