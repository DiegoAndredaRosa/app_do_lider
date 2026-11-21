import '/auth/supabase_auth/auth_util.dart';
import '/core/app_enums.dart';
import '/core/app_theme.dart';
import '/core/app_utils.dart';
import '/core/app_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'page_login_widget.dart' show PageLoginWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PageLoginModel extends AppModel<PageLoginWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtEmailLogin widget.
  FocusNode? txtEmailLoginFocusNode;
  TextEditingController? txtEmailLoginTextController;
  String? Function(BuildContext, String?)? txtEmailLoginTextControllerValidator;
  String? _txtEmailLoginTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Digite um e-mail';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Digite um e-mail válido';
    }
    return null;
  }

  // State field(s) for txtSenhaLogin widget.
  late FocusNode txtSenhaLoginPasswordVisibilityFocusNode;
  FocusNode? txtSenhaLoginFocusNode;
  TextEditingController? txtSenhaLoginTextController;
  late bool txtSenhaLoginVisibility;
  String? Function(BuildContext, String?)? txtSenhaLoginTextControllerValidator;
  String? _txtSenhaLoginTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Digite sua senha';
    }

    if (!RegExp('^(?=.*[A-Za-z])(?=.*\\d).{6,20}\$').hasMatch(val)) {
      return 'Requisitos:\n* pelo menos 6 caracteres\n* no máximo 20 caracteres\n* pelo menos 1 letra\n* pelo menos 1 número';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    txtEmailLoginTextControllerValidator =
        _txtEmailLoginTextControllerValidator;
    txtSenhaLoginPasswordVisibilityFocusNode = FocusNode();
    txtSenhaLoginVisibility = false;
    txtSenhaLoginTextControllerValidator =
        _txtSenhaLoginTextControllerValidator;
  }

  @override
  void dispose() {
    txtEmailLoginFocusNode?.dispose();
    txtEmailLoginTextController?.dispose();

    txtSenhaLoginFocusNode?.dispose();
    txtSenhaLoginTextController?.dispose();
    txtSenhaLoginPasswordVisibilityFocusNode.dispose();
  }
}
