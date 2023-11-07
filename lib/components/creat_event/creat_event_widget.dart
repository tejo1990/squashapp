import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'creat_event_model.dart';
export 'creat_event_model.dart';

class CreatEventWidget extends StatefulWidget {
  const CreatEventWidget({Key? key}) : super(key: key);

  @override
  _CreatEventWidgetState createState() => _CreatEventWidgetState();
}

class _CreatEventWidgetState extends State<CreatEventWidget> {
  late CreatEventModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatEventModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '날짜 :',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      Text(
                        dateTimeFormat(
                            'yMMMd', FFAppState().appStateSelectedDate),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      SizedBox(
                        height: 100.0,
                        child: VerticalDivider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                      Text(
                        '시작 시간 : ',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          final _datePicked1Time = await showTimePicker(
                            context: context,
                            initialTime:
                                TimeOfDay.fromDateTime(getCurrentTimestamp),
                          );
                          if (_datePicked1Time != null) {
                            safeSetState(() {
                              _model.datePicked1 = DateTime(
                                getCurrentTimestamp.year,
                                getCurrentTimestamp.month,
                                getCurrentTimestamp.day,
                                _datePicked1Time.hour,
                                _datePicked1Time.minute,
                              );
                            });
                          }
                        },
                        child: Text(
                          valueOrDefault<String>(
                            dateTimeFormat('jm', _model.datePicked1),
                            '00',
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                        child: Text(
                          '종료 시간 : ',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          final _datePicked2Time = await showTimePicker(
                            context: context,
                            initialTime:
                                TimeOfDay.fromDateTime(getCurrentTimestamp),
                          );
                          if (_datePicked2Time != null) {
                            safeSetState(() {
                              _model.datePicked2 = DateTime(
                                getCurrentTimestamp.year,
                                getCurrentTimestamp.month,
                                getCurrentTimestamp.day,
                                _datePicked2Time.hour,
                                _datePicked2Time.minute,
                              );
                            });
                          }
                        },
                        child: Text(
                          valueOrDefault<String>(
                            dateTimeFormat('jm', _model.datePicked2),
                            '00',
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Divider(
          thickness: 10.0,
          color: FlutterFlowTheme.of(context).info,
        ),
        Expanded(
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: '일정을 적어주세요.',
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    maxLines: 20,
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    await ScheduleRecord.collection
                        .doc()
                        .set(createScheduleRecordData(
                          date: FFAppState().appStateSelectedDate,
                          contents: valueOrDefault<String>(
                            _model.textController.text,
                            '일정 내용을 적어주세요.',
                          ),
                          startTime: _model.datePicked1,
                          endTime: _model.datePicked2,
                        ));
                    setState(() {
                      _model.textController?.clear();
                    });
                    context.safePop();
                  },
                  text: '일정 저장',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
