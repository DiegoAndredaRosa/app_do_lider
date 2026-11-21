import '/backend/supabase/supabase.dart';
import '/core/app_enums.dart';
import '/core/app_drop_down.dart';
import '/core/app_icon_button.dart';
import '/core/app_theme.dart';
import '/core/app_utils.dart';
import '/core/app_widgets.dart';
import '/core/form_field_controller.dart';
import 'dart:ui';
import '/core/custom_functions.dart' as functions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'cadastro_membro_model.dart';
export 'cadastro_membro_model.dart';

class CadastroMembroWidget extends StatefulWidget {
  const CadastroMembroWidget({
    super.key,
    required this.recebeinfoGR,
  });

  final TbGrsRow? recebeinfoGR;

  @override
  State<CadastroMembroWidget> createState() => _CadastroMembroWidgetState();
}

class _CadastroMembroWidgetState extends State<CadastroMembroWidget> {
  late CadastroMembroModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createAppModel(context, () => CadastroMembroModel());

    _model.txtNomeMembroTextController ??= TextEditingController();
    _model.txtNomeMembroFocusNode ??= FocusNode();

    _model.txtDataNascMembroTextController ??= TextEditingController();
    _model.txtDataNascMembroFocusNode ??= FocusNode();

    _model.txtDataNascMembroMask = MaskTextInputFormatter(
        mask: '##/##/####',
        initialText: _model.txtDataNascMembroTextController?.text);
    _model.txtDataBatizadoTextController ??= TextEditingController();
    _model.txtDataBatizadoFocusNode ??= FocusNode();

    _model.txtDataBatizadoMask = MaskTextInputFormatter(
        mask: '##/##/####',
        initialText: _model.txtDataBatizadoTextController?.text);
    _model.txtTelefoneTextController ??= TextEditingController();
    _model.txtTelefoneFocusNode ??= FocusNode();

    _model.txtTelefoneMask = MaskTextInputFormatter(
        mask: '(##)#####-####',
        initialText: _model.txtTelefoneTextController?.text);
    _model.txtEmailTextController ??= TextEditingController();
    _model.txtEmailFocusNode ??= FocusNode();

    _model.txtEnderecoTextController ??= TextEditingController();
    _model.txtEnderecoFocusNode ??= FocusNode();

    _model.txtComplementoTextController ??= TextEditingController();
    _model.txtComplementoFocusNode ??= FocusNode();

    _model.txtBairroTextController ??= TextEditingController();
    _model.txtBairroFocusNode ??= FocusNode();

    _model.txtCidadeTextController ??= TextEditingController();
    _model.txtCidadeFocusNode ??= FocusNode();
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
                autovalidateMode: AutovalidateMode.always,
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
                                  'Infos Pessoais',
                                  style:
                                      AppTheme.of(context).bodyMedium.override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle: AppTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                            ),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: AppTheme.of(context)
                                                .bodyMedium
                                                .fontStyle,
                                          ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Text(
                                          'Nome:',
                                          style: AppTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      AppTheme.of(context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      AppTheme.of(context)
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
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: 200.0,
                                        child: TextFormField(
                                          controller: _model
                                              .txtNomeMembroTextController,
                                          focusNode:
                                              _model.txtNomeMembroFocusNode,
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
                                                  fontWeight:
                                                      AppTheme.of(context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      AppTheme.of(context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                            hintText: 'Nome',
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
                                                  fontWeight:
                                                      AppTheme.of(context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      AppTheme.of(context)
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
                                                color:
                                                    AppTheme.of(context).error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    AppTheme.of(context).error,
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
                                                  fontWeight:
                                                      AppTheme.of(context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      AppTheme.of(context)
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
                                              .txtNomeMembroTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Data de nascimento:',
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
                                            controller: _model
                                                .txtDataNascMembroTextController,
                                            focusNode: _model
                                                .txtDataNascMembroFocusNode,
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
                                                    fontWeight:
                                                        AppTheme.of(context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        AppTheme.of(context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                              hintText: dateTimeFormat(
                                                "d/M/y",
                                                getCurrentTimestamp,
                                                locale:
                                                    AppLocalizations.of(context)
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
                                                    fontWeight:
                                                        AppTheme.of(context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        AppTheme.of(context)
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
                                                  color: AppTheme.of(context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: AppTheme.of(context)
                                                      .error,
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
                                                    fontWeight:
                                                        AppTheme.of(context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        AppTheme.of(context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      AppTheme.of(context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      AppTheme.of(context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                            cursorColor: AppTheme.of(context)
                                                .primaryText,
                                            enableInteractiveSelection: true,
                                            validator: _model
                                                .txtDataNascMembroTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              _model.txtDataNascMembroMask
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
                                          final _datePicked1Date =
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
                                                    AppTheme.of(context)
                                                        .primary,
                                                headerForegroundColor:
                                                    AppTheme.of(context).info,
                                                headerTextStyle: AppTheme.of(
                                                        context)
                                                    .headlineLarge
                                                    .override(
                                                      font: GoogleFonts
                                                          .interTight(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            AppTheme.of(context)
                                                                .headlineLarge
                                                                .fontStyle,
                                                      ),
                                                      fontSize: 32.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                                    AppTheme.of(context)
                                                        .primary,
                                                selectedDateTimeForegroundColor:
                                                    AppTheme.of(context).info,
                                                actionButtonForegroundColor:
                                                    AppTheme.of(context)
                                                        .primaryText,
                                                iconSize: 24.0,
                                              );
                                            },
                                          );

                                          if (_datePicked1Date != null) {
                                            safeSetState(() {
                                              _model.datePicked1 = DateTime(
                                                _datePicked1Date.year,
                                                _datePicked1Date.month,
                                                _datePicked1Date.day,
                                              );
                                            });
                                          } else if (_model.datePicked1 !=
                                              null) {
                                            safeSetState(() {
                                              _model.datePicked1 =
                                                  getCurrentTimestamp;
                                            });
                                          }
                                          safeSetState(() {
                                            _model
                                                .txtDataNascMembroTextController
                                                ?.text = dateTimeFormat(
                                              "d/M/y",
                                              _model.datePicked1,
                                              locale:
                                                  AppLocalizations.of(context)
                                                      .languageCode,
                                            );
                                            _model.txtDataNascMembroMask
                                                .updateMask(
                                              newValue: TextEditingValue(
                                                text: _model
                                                    .txtDataNascMembroTextController!
                                                    .text,
                                              ),
                                            );
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Batizado:',
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      AppDropDown<bool>(
                                        controller:
                                            _model.dpBatizadoValueController ??=
                                                FormFieldController<bool>(
                                          _model.dpBatizadoValue ??= false,
                                        ),
                                        options: List<bool>.from([true, false]),
                                        optionLabels: ['Sim', 'Não'],
                                        onChanged: (val) => safeSetState(
                                            () => _model.dpBatizadoValue = val),
                                        width: 200.0,
                                        height: 40.0,
                                        textStyle: AppTheme.of(context)
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
                                        hintText: 'Select...',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: AppTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: AppTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor: Colors.transparent,
                                        borderWidth: 0.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        hidesUnderline: true,
                                        isOverButton: false,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (_model.dpBatizadoValue ?? true)
                                      Text(
                                        'Batizado Data:',
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (_model.dpBatizadoValue ?? true)
                                        Expanded(
                                          child: Container(
                                            width: 200.0,
                                            child: TextFormField(
                                              controller: _model
                                                  .txtDataBatizadoTextController,
                                              focusNode: _model
                                                  .txtDataBatizadoFocusNode,
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
                                                      fontWeight:
                                                          AppTheme.of(context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          AppTheme.of(context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                                hintText: dateTimeFormat(
                                                  "d/M/y",
                                                  getCurrentTimestamp,
                                                  locale: AppLocalizations.of(
                                                          context)
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
                                                      fontWeight:
                                                          AppTheme.of(context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          AppTheme.of(context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: AppTheme.of(context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: AppTheme.of(context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor: AppTheme.of(context)
                                                    .secondaryBackground,
                                              ),
                                              style: AppTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          AppTheme.of(context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          AppTheme.of(context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        AppTheme.of(context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        AppTheme.of(context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                              keyboardType:
                                                  (AppKeyboardType.text)
                                                      .flutterValue,
                                              cursorColor: AppTheme.of(context)
                                                  .primaryText,
                                              enableInteractiveSelection: true,
                                              validator: _model
                                                  .txtDataBatizadoTextControllerValidator
                                                  .asValidator(context),
                                              inputFormatters: [
                                                _model.txtDataBatizadoMask
                                              ],
                                            ),
                                          ),
                                        ),
                                      if (_model.dpBatizadoValue ?? true)
                                        AppIconButton(
                                          borderRadius: 8.0,
                                          buttonSize: 40.0,
                                          fillColor:
                                              AppTheme.of(context).primary,
                                          icon: Icon(
                                            Icons.calendar_month,
                                            color: AppTheme.of(context).info,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            // datePickerDataBatizado
                                            final _datePicked2Date =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: getCurrentTimestamp,
                                              firstDate:
                                                  (DateTime(1900, 1, 1) ??
                                                      DateTime(1900)),
                                              lastDate: (getCurrentTimestamp ??
                                                  DateTime(2050)),
                                              builder: (context, child) {
                                                return wrapInMaterialDatePickerTheme(
                                                  context,
                                                  child!,
                                                  headerBackgroundColor:
                                                      AppTheme.of(context)
                                                          .primary,
                                                  headerForegroundColor:
                                                      AppTheme.of(context).info,
                                                  headerTextStyle: AppTheme.of(
                                                          context)
                                                      .headlineLarge
                                                      .override(
                                                        font: GoogleFonts
                                                            .interTight(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              AppTheme.of(
                                                                      context)
                                                                  .headlineLarge
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 32.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
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
                                                      AppTheme.of(context)
                                                          .primary,
                                                  selectedDateTimeForegroundColor:
                                                      AppTheme.of(context).info,
                                                  actionButtonForegroundColor:
                                                      AppTheme.of(context)
                                                          .primaryText,
                                                  iconSize: 24.0,
                                                );
                                              },
                                            );

                                            if (_datePicked2Date != null) {
                                              safeSetState(() {
                                                _model.datePicked2 = DateTime(
                                                  _datePicked2Date.year,
                                                  _datePicked2Date.month,
                                                  _datePicked2Date.day,
                                                );
                                              });
                                            } else if (_model.datePicked2 !=
                                                null) {
                                              safeSetState(() {
                                                _model.datePicked2 =
                                                    getCurrentTimestamp;
                                              });
                                            }
                                            safeSetState(() {
                                              _model
                                                  .txtDataBatizadoTextController
                                                  ?.text = dateTimeFormat(
                                                "d/M/y",
                                                _model.datePicked2,
                                                locale:
                                                    AppLocalizations.of(context)
                                                        .languageCode,
                                              );
                                              _model.txtDataBatizadoMask
                                                  .updateMask(
                                                newValue: TextEditingValue(
                                                  text: _model
                                                      .txtDataBatizadoTextController!
                                                      .text,
                                                ),
                                              );
                                            });
                                          },
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Contatos',
                                    style: AppTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontStyle: AppTheme.of(context)
                                                .bodyMedium
                                                .fontStyle,
                                          ),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: AppTheme.of(context)
                                              .bodyMedium
                                              .fontStyle,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Text(
                                          'Telefone/WhatsApp:',
                                          style: AppTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      AppTheme.of(context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      AppTheme.of(context)
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
                                      ),
                                    ],
                                  ),
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
                                            controller: _model
                                                .txtTelefoneTextController,
                                            focusNode:
                                                _model.txtTelefoneFocusNode,
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
                                                    fontWeight:
                                                        AppTheme.of(context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        AppTheme.of(context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                              hintText: '(00)00000-0000',
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
                                                    fontWeight:
                                                        AppTheme.of(context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        AppTheme.of(context)
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
                                                  color: AppTheme.of(context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: AppTheme.of(context)
                                                      .error,
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
                                                    fontWeight:
                                                        AppTheme.of(context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        AppTheme.of(context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      AppTheme.of(context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      AppTheme.of(context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                            cursorColor: AppTheme.of(context)
                                                .primaryText,
                                            enableInteractiveSelection: true,
                                            validator: _model
                                                .txtTelefoneTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              _model.txtTelefoneMask
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'E-mail:',
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
                                                _model.txtEmailTextController,
                                            focusNode: _model.txtEmailFocusNode,
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
                                                    fontWeight:
                                                        AppTheme.of(context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        AppTheme.of(context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                              hintText: 'exemplo@email.com',
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
                                                    fontWeight:
                                                        AppTheme.of(context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        AppTheme.of(context)
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
                                                  color: AppTheme.of(context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: AppTheme.of(context)
                                                      .error,
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
                                                    fontWeight:
                                                        AppTheme.of(context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        AppTheme.of(context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      AppTheme.of(context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      AppTheme.of(context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                            keyboardType:
                                                (AppKeyboardType.emailAddress)
                                                    .flutterValue,
                                            cursorColor: AppTheme.of(context)
                                                .primaryText,
                                            enableInteractiveSelection: true,
                                            validator: _model
                                                .txtEmailTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Endereço',
                                    style: AppTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontStyle: AppTheme.of(context)
                                                .bodyMedium
                                                .fontStyle,
                                          ),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: AppTheme.of(context)
                                              .bodyMedium
                                              .fontStyle,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Text(
                                          'Endereço(rua e num):',
                                          style: AppTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      AppTheme.of(context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      AppTheme.of(context)
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
                                      ),
                                    ],
                                  ),
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
                                            controller: _model
                                                .txtEnderecoTextController,
                                            focusNode:
                                                _model.txtEnderecoFocusNode,
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
                                                    fontWeight:
                                                        AppTheme.of(context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        AppTheme.of(context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                              hintText: 'Endereço',
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
                                                    fontWeight:
                                                        AppTheme.of(context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        AppTheme.of(context)
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
                                                  color: AppTheme.of(context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: AppTheme.of(context)
                                                      .error,
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
                                                    fontWeight:
                                                        AppTheme.of(context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        AppTheme.of(context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      AppTheme.of(context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      AppTheme.of(context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                            cursorColor: AppTheme.of(context)
                                                .primaryText,
                                            enableInteractiveSelection: true,
                                            validator: _model
                                                .txtEnderecoTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Complemento:',
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
                                            controller: _model
                                                .txtComplementoTextController,
                                            focusNode:
                                                _model.txtComplementoFocusNode,
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
                                                    fontWeight:
                                                        AppTheme.of(context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        AppTheme.of(context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                              hintText: 'Complemento',
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
                                                    fontWeight:
                                                        AppTheme.of(context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        AppTheme.of(context)
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
                                                  color: AppTheme.of(context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: AppTheme.of(context)
                                                      .error,
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
                                                    fontWeight:
                                                        AppTheme.of(context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        AppTheme.of(context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      AppTheme.of(context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      AppTheme.of(context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                            cursorColor: AppTheme.of(context)
                                                .primaryText,
                                            enableInteractiveSelection: true,
                                            validator: _model
                                                .txtComplementoTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Bairro:',
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
                                                _model.txtBairroTextController,
                                            focusNode:
                                                _model.txtBairroFocusNode,
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
                                                    fontWeight:
                                                        AppTheme.of(context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        AppTheme.of(context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                              hintText: 'Bairro',
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
                                                    fontWeight:
                                                        AppTheme.of(context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        AppTheme.of(context)
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
                                                  color: AppTheme.of(context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: AppTheme.of(context)
                                                      .error,
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
                                                    fontWeight:
                                                        AppTheme.of(context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        AppTheme.of(context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      AppTheme.of(context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      AppTheme.of(context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                            cursorColor: AppTheme.of(context)
                                                .primaryText,
                                            enableInteractiveSelection: true,
                                            validator: _model
                                                .txtBairroTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Cidade:',
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
                                                _model.txtCidadeTextController,
                                            focusNode:
                                                _model.txtCidadeFocusNode,
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
                                                    fontWeight:
                                                        AppTheme.of(context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        AppTheme.of(context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                              hintText: 'Cidade',
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
                                                    fontWeight:
                                                        AppTheme.of(context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        AppTheme.of(context)
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
                                                  color: AppTheme.of(context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: AppTheme.of(context)
                                                      .error,
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
                                                    fontWeight:
                                                        AppTheme.of(context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        AppTheme.of(context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      AppTheme.of(context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      AppTheme.of(context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                            cursorColor: AppTheme.of(context)
                                                .primaryText,
                                            enableInteractiveSelection: true,
                                            validator: _model
                                                .txtCidadeTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
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
                              _model.membroSalvo =
                                  await TbMembrosTable().insert({
                                'nome': _model.txtNomeMembroTextController.text,
                                'datanasc': supaSerialize<DateTime>(
                                    functions.formataData(_model
                                        .txtDataNascMembroTextController.text)),
                                'batizado': _model.dpBatizadoValue,
                                'telefone':
                                    _model.txtTelefoneTextController.text,
                                'email': _model.txtEmailTextController.text,
                                'endereco':
                                    _model.txtEnderecoTextController.text,
                                'complemento':
                                    _model.txtComplementoTextController.text,
                                'bairro': _model.txtBairroTextController.text,
                                'cidade': _model.txtCidadeTextController.text,
                                'databatiz': supaSerialize<DateTime>(
                                    functions.formataData(_model
                                        .txtDataBatizadoTextController.text)),
                                'ativo': true,
                              });
                              await TbGrMembrosTable().insert({
                                'gr_id': widget!.recebeinfoGR?.id,
                                'membro_id': _model.membroSalvo?.id,
                                'ativo': true,
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Membro adicionado com sucesso!',
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
                                _model.txtCidadeTextController?.clear();
                                _model.txtBairroTextController?.clear();
                                _model.txtComplementoTextController?.clear();
                                _model.txtEnderecoTextController?.clear();
                                _model.txtEmailTextController?.clear();
                                _model.txtTelefoneTextController?.clear();
                                _model.txtTelefoneMask.clear();
                                _model.txtDataBatizadoTextController?.clear();
                                _model.txtDataBatizadoMask.clear();
                                _model.txtDataNascMembroTextController?.clear();
                                _model.txtDataNascMembroMask.clear();
                                _model.txtNomeMembroTextController?.clear();
                              });

                              safeSetState(() {});
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
