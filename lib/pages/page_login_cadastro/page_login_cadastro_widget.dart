import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/core/app_enums.dart';
import '/core/app_icon_button.dart';
import '/core/app_theme.dart';
import '/core/app_utils.dart';
import '/core/app_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'page_login_cadastro_model.dart';
export 'page_login_cadastro_model.dart';

class PageLoginCadastroWidget extends StatefulWidget {
  const PageLoginCadastroWidget({super.key});

  static String routeName = 'PageLoginCadastro';
  static String routePath = '/pageLoginCadastro';

  @override
  State<PageLoginCadastroWidget> createState() =>
      _PageLoginCadastroWidgetState();
}

class _PageLoginCadastroWidgetState extends State<PageLoginCadastroWidget> {
  late PageLoginCadastroModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createAppModel(context, () => PageLoginCadastroModel());

    _model.txtNomeCadastroTextController ??= TextEditingController();
    _model.txtNomeCadastroFocusNode ??= FocusNode();

    _model.txtEmailCadastroTextController ??= TextEditingController();
    _model.txtEmailCadastroFocusNode ??= FocusNode();

    _model.txtSenhaCadastroTextController ??= TextEditingController();
    _model.txtSenhaCadastroFocusNode ??= FocusNode();

    _model.txtSenhaConfCadastroTextController ??= TextEditingController();
    _model.txtSenhaConfCadastroFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(valueOrDefault<double>(
              () {
                if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                  return 16.0;
                } else if (MediaQuery.sizeOf(context).width <
                    kBreakpointMedium) {
                  return 56.0;
                } else if (MediaQuery.sizeOf(context).width <
                    kBreakpointLarge) {
                  return 84.0;
                } else {
                  return 84.0;
                }
              }(),
              0.0,
            )),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: AppTheme.of(context).alternate,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: (AppMainAxisAlignment.center).flutterValue,
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: AppTheme.of(context).alternate,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: Image.asset(
                          'assets/images/logo.jpg',
                        ).image,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 500.0,
                    decoration: BoxDecoration(
                      color: AppTheme.of(context).alternate,
                    ),
                    child: Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment:
                            (AppMainAxisAlignment.center).flutterValue,
                        crossAxisAlignment:
                            (AppCrossAxisAlignment.start).flutterValue,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            'Nome',
                            textAlign: TextAlign.start,
                            style: AppTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: AppTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle:
                                      AppTheme.of(context).bodyMedium.fontStyle,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller:
                                    _model.txtNomeCadastroTextController,
                                focusNode: _model.txtNomeCadastroFocusNode,
                                autofocus: false,
                                enabled: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle:
                                      AppTheme.of(context).labelMedium.override(
                                            font: GoogleFonts.inter(
                                              fontWeight: AppTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                              fontStyle: AppTheme.of(context)
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
                                  hintText: 'Digite seu nome',
                                  hintStyle:
                                      AppTheme.of(context).labelMedium.override(
                                            font: GoogleFonts.inter(
                                              fontWeight: AppTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                              fontStyle: AppTheme.of(context)
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
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor:
                                      AppTheme.of(context).secondaryBackground,
                                ),
                                style: AppTheme.of(context).bodyMedium.override(
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
                                cursorColor: AppTheme.of(context).primaryText,
                                enableInteractiveSelection: true,
                                validator: _model
                                    .txtNomeCadastroTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Text(
                            'E-mail',
                            textAlign: TextAlign.start,
                            style: AppTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: AppTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle:
                                      AppTheme.of(context).bodyMedium.fontStyle,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller:
                                    _model.txtEmailCadastroTextController,
                                focusNode: _model.txtEmailCadastroFocusNode,
                                autofocus: false,
                                enabled: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle:
                                      AppTheme.of(context).labelMedium.override(
                                            font: GoogleFonts.inter(
                                              fontWeight: AppTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                              fontStyle: AppTheme.of(context)
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
                                  hintText: 'exemplo@email.com',
                                  hintStyle:
                                      AppTheme.of(context).labelMedium.override(
                                            font: GoogleFonts.inter(
                                              fontWeight: AppTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                              fontStyle: AppTheme.of(context)
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
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor:
                                      AppTheme.of(context).secondaryBackground,
                                  prefixIcon: Icon(
                                    Icons.email_sharp,
                                  ),
                                ),
                                style: AppTheme.of(context).bodyMedium.override(
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
                                keyboardType:
                                    (AppKeyboardType.text).flutterValue,
                                cursorColor: AppTheme.of(context).primaryText,
                                enableInteractiveSelection: true,
                                validator: _model
                                    .txtEmailCadastroTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Text(
                            'Senha',
                            textAlign: TextAlign.start,
                            style: AppTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: AppTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle:
                                      AppTheme.of(context).bodyMedium.fontStyle,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller:
                                    _model.txtSenhaCadastroTextController,
                                focusNode: _model.txtSenhaCadastroFocusNode,
                                autofocus: false,
                                enabled: true,
                                obscureText: !_model.txtSenhaCadastroVisibility,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle:
                                      AppTheme.of(context).labelMedium.override(
                                            font: GoogleFonts.inter(
                                              fontWeight: AppTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                              fontStyle: AppTheme.of(context)
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
                                  hintText: 'Digite sua senha',
                                  hintStyle:
                                      AppTheme.of(context).labelMedium.override(
                                            font: GoogleFonts.inter(
                                              fontWeight: AppTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                              fontStyle: AppTheme.of(context)
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
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor:
                                      AppTheme.of(context).secondaryBackground,
                                  prefixIcon: Icon(
                                    Icons.lock_sharp,
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: () async {
                                      safeSetState(() => _model
                                              .txtSenhaCadastroVisibility =
                                          !_model.txtSenhaCadastroVisibility);
                                    },
                                    focusNode: _model
                                        .txtSenhaCadastroPasswordVisibilityFocusNode
                                      ..skipTraversal = !(false),
                                    child: Icon(
                                      _model.txtSenhaCadastroVisibility
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      size: 22,
                                    ),
                                  ),
                                ),
                                style: AppTheme.of(context).bodyMedium.override(
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
                                cursorColor: AppTheme.of(context).primaryText,
                                enableInteractiveSelection: true,
                                validator: _model
                                    .txtSenhaCadastroTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Text(
                            'Confirme a Senha',
                            textAlign: TextAlign.start,
                            style: AppTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: AppTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle:
                                      AppTheme.of(context).bodyMedium.fontStyle,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller:
                                    _model.txtSenhaConfCadastroTextController,
                                focusNode: _model.txtSenhaConfCadastroFocusNode,
                                autofocus: false,
                                enabled: true,
                                obscureText:
                                    !_model.txtSenhaConfCadastroVisibility,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle:
                                      AppTheme.of(context).labelMedium.override(
                                            font: GoogleFonts.inter(
                                              fontWeight: AppTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                              fontStyle: AppTheme.of(context)
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
                                  hintText: 'Confirme sua senha',
                                  hintStyle:
                                      AppTheme.of(context).labelMedium.override(
                                            font: GoogleFonts.inter(
                                              fontWeight: AppTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                              fontStyle: AppTheme.of(context)
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
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor:
                                      AppTheme.of(context).secondaryBackground,
                                  prefixIcon: Icon(
                                    Icons.lock_sharp,
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: () async {
                                      safeSetState(() => _model
                                              .txtSenhaConfCadastroVisibility =
                                          !_model
                                              .txtSenhaConfCadastroVisibility);
                                    },
                                    focusNode: _model
                                        .txtSenhaConfCadastroPasswordVisibilityFocusNode
                                      ..skipTraversal = !(false),
                                    child: Icon(
                                      _model.txtSenhaConfCadastroVisibility
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      size: 22,
                                    ),
                                  ),
                                ),
                                style: AppTheme.of(context).bodyMedium.override(
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
                                cursorColor: AppTheme.of(context).primaryText,
                                enableInteractiveSelection: true,
                                validator: _model
                                    .txtSenhaConfCadastroTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 0.0),
                            child: AppButton(
                              onPressed: () async {
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }
                                GoRouter.of(context).prepareAuthEvent();
                                if (_model
                                        .txtSenhaCadastroTextController.text !=
                                    _model.txtSenhaConfCadastroTextController
                                        .text) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Passwords don\'t match!',
                                      ),
                                    ),
                                  );
                                  return;
                                }

                                final user =
                                    await authManager.createAccountWithEmail(
                                  context,
                                  _model.txtEmailCadastroTextController.text,
                                  _model.txtSenhaCadastroTextController.text,
                                );
                                if (user == null) {
                                  return;
                                }

                                if (_model.txtSenhaCadastroVisibility ==
                                    _model.txtSenhaConfCadastroVisibility) {
                                  await TbUsuariosTable().insert({
                                    'user_id': currentUserUid,
                                    'nome': _model
                                        .txtNomeCadastroTextController.text,
                                    'email': _model
                                        .txtEmailCadastroTextController.text,
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Conta criada com sucesso!',
                                        style: TextStyle(
                                          color:
                                              AppTheme.of(context).primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          AppTheme.of(context).secondary,
                                    ),
                                  );

                                  context.pushNamedAuth(
                                      PageLoginWidget.routeName,
                                      context.mounted);
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Erro'),
                                        content:
                                            Text('Senhas não estão iguais'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                              text: 'Fazer Cadastro',
                              options: AppButtonOptions(
                                width: double.infinity,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: AppIconButton(
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              fillColor: AppTheme.of(context).primary,
                              icon: Icon(
                                Icons.arrow_back,
                                color: AppTheme.of(context).info,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.safePop();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
