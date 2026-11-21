import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/core/app_enums.dart';
import '/core/app_icon_button.dart';
import '/core/app_theme.dart';
import '/core/app_utils.dart';
import '/core/app_widgets.dart';
import 'dart:ui';
import 'cadastro_g_r_widget.dart' show CadastroGRWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CadastroGRModel extends AppModel<CadastroGRWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtNomeGR widget.
  FocusNode? txtNomeGRFocusNode;
  TextEditingController? txtNomeGRTextController;
  String? Function(BuildContext, String?)? txtNomeGRTextControllerValidator;
  String? _txtNomeGRTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Preencha o nome do GR';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    txtNomeGRTextControllerValidator = _txtNomeGRTextControllerValidator;
  }

  @override
  void dispose() {
    txtNomeGRFocusNode?.dispose();
    txtNomeGRTextController?.dispose();
  }
}
