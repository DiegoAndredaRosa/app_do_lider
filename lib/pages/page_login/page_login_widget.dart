import '/auth/supabase_auth/auth_util.dart';
import '/core/app_enums.dart';
import '/core/app_theme.dart';
import '/core/app_utils.dart';
import '/core/app_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'page_login_model.dart';
export 'page_login_model.dart';

class PageLoginWidget extends StatefulWidget {
  const PageLoginWidget({super.key});

  static String routeName = 'PageLogin';
  static String routePath = '/pageLogin';

  @override
  State<PageLoginWidget> createState() => _PageLoginWidgetState();
}

class _PageLoginWidgetState extends State<PageLoginWidget> {
  late PageLoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createAppModel(context, () => PageLoginModel());

    _model.txtEmailLoginTextController ??= TextEditingController();
    _model.txtEmailLoginFocusNode ??= FocusNode();

    _model.txtSenhaLoginTextController ??= TextEditingController();
    _model.txtSenhaLoginFocusNode ??= FocusNode();
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
        backgroundColor: AppTheme.of(context).primaryBackground,
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
                                controller: _model.txtEmailLoginTextController,
                                focusNode: _model.txtEmailLoginFocusNode,
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
                                cursorColor: AppTheme.of(context).primaryText,
                                enableInteractiveSelection: true,
                                validator: _model
                                    .txtEmailLoginTextControllerValidator
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
                                controller: _model.txtSenhaLoginTextController,
                                focusNode: _model.txtSenhaLoginFocusNode,
                                autofocus: false,
                                enabled: true,
                                obscureText: !_model.txtSenhaLoginVisibility,
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
                                      safeSetState(() =>
                                          _model.txtSenhaLoginVisibility =
                                              !_model.txtSenhaLoginVisibility);
                                    },
                                    focusNode: _model
                                        .txtSenhaLoginPasswordVisibilityFocusNode
                                      ..skipTraversal = !(false),
                                    child: Icon(
                                      _model.txtSenhaLoginVisibility
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
                                    .txtSenhaLoginTextControllerValidator
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

                                final user = await authManager.signInWithEmail(
                                  context,
                                  _model.txtEmailLoginTextController.text,
                                  _model.txtSenhaLoginTextController.text,
                                );
                                if (user == null) {
                                  return;
                                }

                                context.goNamedAuth(
                                    HomePageWidget.routeName, context.mounted);
                              },
                              text: 'Login',
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
                                0.0, 16.0, 0.0, 0.0),
                            child: AppButton(
                              onPressed: () async {
                                context.pushNamed(
                                    PageLoginCadastroWidget.routeName);
                              },
                              text: 'Fazer Cadastro',
                              options: AppButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: AppTheme.of(context).alternate,
                                textStyle:
                                    AppTheme.of(context).titleSmall.override(
                                          font: GoogleFonts.interTight(
                                            fontWeight: FontWeight.normal,
                                            fontStyle: AppTheme.of(context)
                                                .titleSmall
                                                .fontStyle,
                                          ),
                                          color: Colors.black,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle: AppTheme.of(context)
                                              .titleSmall
                                              .fontStyle,
                                        ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(0.0),
                              ),
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
