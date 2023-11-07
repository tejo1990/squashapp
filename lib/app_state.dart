import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  DateTime? _appStateSelectedDate =
      DateTime.fromMillisecondsSinceEpoch(1698879600000);
  DateTime? get appStateSelectedDate => _appStateSelectedDate;
  set appStateSelectedDate(DateTime? _value) {
    _appStateSelectedDate = _value;
  }

  final _chatManager = StreamRequestManager<List<OpenChatMessageRecord>>();
  Stream<List<OpenChatMessageRecord>> chat({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<OpenChatMessageRecord>> Function() requestFn,
  }) =>
      _chatManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearChatCache() => _chatManager.clear();
  void clearChatCacheKey(String? uniqueKey) =>
      _chatManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
