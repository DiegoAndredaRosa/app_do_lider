import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/core/app_enums.dart';
import '/core/app_icon_button.dart';
import '/core/app_theme.dart';
import '/core/app_utils.dart';
import '/core/app_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'page_login_cadastro_widget.dart' show PageLoginCadastroWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PageLoginCadastroModel extends AppModel<PageLoginCadastroWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtNomeCadastro widget.
  FocusNode? txtNomeCadastroFocusNode;
  TextEditingController? txtNomeCadastroTextController;
  String? Function(BuildContext, String?)?
      txtNomeCadastroTextControllerValidator;
  String? _txtNomeCadastroTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Digite um nome';
    }

    if (val.length < 2) {
      return 'Digite um nome';
    }

    return null;
  }

  // State field(s) for txtEmailCadastro widget.
  FocusNode? txtEmailCadastroFocusNode;
  TextEditingController? txtEmailCadastroTextController;
  String? Function(BuildContext, String?)?
      txtEmailCadastroTextControllerValidator;
  String? _txtEmailCadastroTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'preencha o e-mail';
    }

    if (val.length > 50) {
      return 'Limite de tamanho do e-mail excedido';
    }
    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Digite um e-mail válido';
    }
    return null;
  }

  // State field(s) for txtSenhaCadastro widget.
  late FocusNode txtSenhaCadastroPasswordVisibilityFocusNode;
  FocusNode? txtSenhaCadastroFocusNode;
  TextEditingController? txtSenhaCadastroTextController;
  late bool txtSenhaCadastroVisibility;
  String? Function(BuildContext, String?)?
      txtSenhaCadastroTextControllerValidator;
  String? _txtSenhaCadastroTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Digite sua senha';
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^(?=.*[A-Za-z])(?=.*\\d).{6,20}\$').hasMatch(val)) {
      return 'Requisitos:\n* pelo menos 6 caracteres\n* no máximo 20 caracteres\n* pelo menos 1 letra\n* pelo menos 1 número';
    }
    return null;
  }

  // State field(s) for txtSenhaConfCadastro widget.
  late FocusNode txtSenhaConfCadastroPasswordVisibilityFocusNode;
  FocusNode? txtSenhaConfCadastroFocusNode;
  TextEditingController? txtSenhaConfCadastroTextController;
  late bool txtSenhaConfCadastroVisibility;
  String? Function(BuildContext, String?)?
      txtSenhaConfCadastroTextControllerValidator;

  @override
  void initState(BuildContext context) {
    txtNomeCadastroTextControllerValidator =
        _txtNomeCadastroTextControllerValidator;
    txtEmailCadastroTextControllerValidator =
        _txtEmailCadastroTextControllerValidator;
    txtSenhaCadastroPasswordVisibilityFocusNode = FocusNode();
    txtSenhaCadastroVisibility = false;
    txtSenhaCadastroTextControllerValidator =
        _txtSenhaCadastroTextControllerValidator;
    txtSenhaConfCadastroPasswordVisibilityFocusNode = FocusNode();
    txtSenhaConfCadastroVisibility = false;
  }

  @override
  void dispose() {
    txtNomeCadastroFocusNode?.dispose();
    txtNomeCadastroTextController?.dispose();

    txtEmailCadastroFocusNode?.dispose();
    txtEmailCadastroTextController?.dispose();

    txtSenhaCadastroFocusNode?.dispose();
    txtSenhaCadastroTextController?.dispose();
    txtSenhaCadastroPasswordVisibilityFocusNode.dispose();
    txtSenhaConfCadastroFocusNode?.dispose();
    txtSenhaConfCadastroTextController?.dispose();
    txtSenhaConfCadastroPasswordVisibilityFocusNode.dispose();
  }
}
