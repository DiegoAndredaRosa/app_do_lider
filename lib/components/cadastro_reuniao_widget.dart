import '/backend/supabase/supabase.dart';
import '/core/app_enums.dart';
import '/core/app_icon_button.dart';
import '/core/app_theme.dart';
import '/core/app_utils.dart';
import '/core/app_widgets.dart';
import 'dart:ui';
import '/core/custom_functions.dart' as functions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'cadastro_reuniao_model.dart';
export 'cadastro_reuniao_model.dart';

class CadastroReuniaoWidget extends StatefulWidget {
  const CadastroReuniaoWidget({
    super.key,
    required this.recebeGRIdReuniao,
  });

  final TbGrsRow? recebeGRIdReuniao;

  @override
  State<CadastroReuniaoWidget> createState() => _CadastroReuniaoWidgetState();
}

class _CadastroReuniaoWidgetState extends State<CadastroReuniaoWidget> {
  late CadastroReuniaoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createAppModel(context, () => CadastroReuniaoModel());

    _model.txtDataReuniaoTextController ??= TextEditingController();
    _model.txtDataReuniaoFocusNode ??= FocusNode();

    _model.txtDataReuniaoMask = MaskTextInputFormatter(
        mask: '##/##/####',
        initialText: _model.txtDataReuniaoTextController?.text);
    _model.txtObsTextController ??= TextEditingController();
    _model.txtObsFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 2.0,
        sigmaY: 2.0,
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          width: 680.0,
          height: 700.0,
          decoration: BoxDecoration(
            color: AppTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Stack(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: (AppMainAxisAlignment.end).flutterValue,
                children: [
                  AppIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: AppTheme.of(context).primary,
                    icon: Icon(
                      Icons.close,
                      color: AppTheme.of(context).info,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 45.0, 16.0, 16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Data da Reunião:',
                                  style:
                                      AppTheme.of(context).bodyMedium.override(
                                            font: GoogleFonts.inter(
                                              fontWeight: AppTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                              fontStyle: AppTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: AppTheme.of(context)
                                                .bodyMedium
                                                .fontWeight,
                                            fontStyle: AppTheme.of(context)
                                                .bodyMedium
                                                .fontStyle,
                                          ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 200.0,
                                      child: TextFormField(
                                        controller:
                                            _model.txtDataReuniaoTextController,
                                        focusNode:
                                            _model.txtDataReuniaoFocusNode,
                                        onFieldSubmitted: (_) async {
                                          await Supabase
                                              .instance.client.functions
                                              .invoke(
                                            'funcFormataData',
                                            body: const {},
                                          );
                                        },
                                        autofocus: false,
                                        enabled: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelStyle: AppTheme.of(context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      AppTheme.of(context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      AppTheme.of(context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: AppTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                                fontStyle: AppTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                              ),
                                          hintText: dateTimeFormat(
                                            "d/M/y",
                                            getCurrentTimestamp,
                                            locale: AppLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          hintStyle: AppTheme.of(context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      AppTheme.of(context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      AppTheme.of(context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: AppTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                                fontStyle: AppTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: AppTheme.of(context).error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: AppTheme.of(context).error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor: AppTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        style: AppTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: AppTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                                fontStyle: AppTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: AppTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                              fontStyle: AppTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                            ),
                                        cursorColor:
                                            AppTheme.of(context).primaryText,
                                        enableInteractiveSelection: true,
                                        validator: _model
                                            .txtDataReuniaoTextControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [
                                          _model.txtDataReuniaoMask
                                        ],
                                      ),
                                    ),
                                  ),
                                  AppIconButton(
                                    borderRadius: 8.0,
                                    buttonSize: 40.0,
                                    fillColor: AppTheme.of(context).primary,
                                    icon: Icon(
                                      Icons.calendar_month,
                                      color: AppTheme.of(context).info,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      // datePickerDataNasc
                                      final _datePickedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: getCurrentTimestamp,
                                        firstDate: (DateTime(1900, 1, 1) ??
                                            DateTime(1900)),
                                        lastDate: (getCurrentTimestamp ??
                                            DateTime(2050)),
                                        builder: (context, child) {
                                          return wrapInMaterialDatePickerTheme(
                                            context,
                                            child!,
                                            headerBackgroundColor:
                                                AppTheme.of(context).primary,
                                            headerForegroundColor:
                                                AppTheme.of(context).info,
                                            headerTextStyle: AppTheme.of(
                                                    context)
                                                .headlineLarge
                                                .override(
                                                  font: GoogleFonts.interTight(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        AppTheme.of(context)
                                                            .headlineLarge
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 32.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      AppTheme.of(context)
                                                          .headlineLarge
                                                          .fontStyle,
                                                ),
                                            pickerBackgroundColor:
                                                AppTheme.of(context)
                                                    .secondaryBackground,
                                            pickerForegroundColor:
                                                AppTheme.of(context)
                                                    .primaryText,
                                            selectedDateTimeBackgroundColor:
                                                AppTheme.of(context).primary,
                                            selectedDateTimeForegroundColor:
                                                AppTheme.of(context).info,
                                            actionButtonForegroundColor:
                                                AppTheme.of(context)
                                                    .primaryText,
                                            iconSize: 24.0,
                                          );
                                        },
                                      );

                                      if (_datePickedDate != null) {
                                        safeSetState(() {
                                          _model.datePicked = DateTime(
                                            _datePickedDate.year,
                                            _datePickedDate.month,
                                            _datePickedDate.day,
                                          );
                                        });
                                      } else if (_model.datePicked != null) {
                                        safeSetState(() {
                                          _model.datePicked =
                                              getCurrentTimestamp;
                                        });
                                      }
                                      safeSetState(() {
                                        _model.txtDataReuniaoTextController
                                            ?.text = dateTimeFormat(
                                          "d/M/y",
                                          _model.datePicked,
                                          locale: AppLocalizations.of(context)
                                              .languageCode,
                                        );
                                        _model.txtDataReuniaoMask.updateMask(
                                          newValue: TextEditingValue(
                                            text: _model
                                                .txtDataReuniaoTextController!
                                                .text,
                                          ),
                                        );
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Tema/obs.:',
                                    style: AppTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: AppTheme.of(context)
                                                .bodyMedium
                                                .fontWeight,
                                            fontStyle: AppTheme.of(context)
                                                .bodyMedium
                                                .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: AppTheme.of(context)
                                              .bodyMedium
                                              .fontWeight,
                                          fontStyle: AppTheme.of(context)
                                              .bodyMedium
                                              .fontStyle,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 200.0,
                                      child: TextFormField(
                                        controller: _model.txtObsTextController,
                                        focusNode: _model.txtObsFocusNode,
                                        autofocus: false,
                                        enabled: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelStyle: AppTheme.of(context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      AppTheme.of(context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      AppTheme.of(context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: AppTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                                fontStyle: AppTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                              ),
                                          hintText: 'Tema/obs.:',
                                          hintStyle: AppTheme.of(context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      AppTheme.of(context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      AppTheme.of(context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: AppTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                                fontStyle: AppTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: AppTheme.of(context).error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: AppTheme.of(context).error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor: AppTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        style: AppTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: AppTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                                fontStyle: AppTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: AppTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                              fontStyle: AppTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                            ),
                                        cursorColor:
                                            AppTheme.of(context).primaryText,
                                        enableInteractiveSelection: true,
                                        validator: _model
                                            .txtObsTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ].divide(SizedBox(height: 8.0)),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: AppButton(
                            onPressed: () async {
                              if (_model.formKey.currentState == null ||
                                  !_model.formKey.currentState!.validate()) {
                                return;
                              }
                              await TbChamadaTable().insert({
                                'obs': _model.txtObsTextController.text,
                                'chamada_data': supaSerialize<DateTime>(
                                    functions.formataData(_model
                                        .txtDataReuniaoTextController.text)),
                                'chamada_gr_id': widget!.recebeGRIdReuniao?.id,
                                'chamada_feita': false,
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'GR cadastrado com sucesso!',
                                    style: TextStyle(
                                      color: AppTheme.of(context).primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      AppTheme.of(context).secondary,
                                ),
                              );
                              _model.updatePage(() {});
                              safeSetState(() {
                                _model.txtDataReuniaoTextController?.clear();
                                _model.txtDataReuniaoMask.clear();
                                _model.txtObsTextController?.clear();
                              });
                            },
                            text: 'Salvar',
                            options: AppButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: AppTheme.of(context).primary,
                              textStyle:
                                  AppTheme.of(context).titleSmall.override(
                                        font: GoogleFonts.interTight(
                                          fontWeight: AppTheme.of(context)
                                              .titleSmall
                                              .fontWeight,
                                          fontStyle: AppTheme.of(context)
                                              .titleSmall
                                              .fontStyle,
                                        ),
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: AppTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: AppTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
