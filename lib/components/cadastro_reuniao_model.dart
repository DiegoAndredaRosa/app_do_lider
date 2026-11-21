import '/backend/supabase/supabase.dart';
import '/core/app_enums.dart';
import '/core/app_icon_button.dart';
import '/core/app_theme.dart';
import '/core/app_utils.dart';
import '/core/app_widgets.dart';
import 'dart:ui';
import '/core/custom_functions.dart' as functions;
import 'cadastro_reuniao_widget.dart' show CadastroReuniaoWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CadastroReuniaoModel extends AppModel<CadastroReuniaoWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtDataReuniao widget.
  FocusNode? txtDataReuniaoFocusNode;
  TextEditingController? txtDataReuniaoTextController;
  late MaskTextInputFormatter txtDataReuniaoMask;
  String? Function(BuildContext, String?)?
      txtDataReuniaoTextControllerValidator;
  String? _txtDataReuniaoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Preencha a data da reunião';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for txtObs widget.
  FocusNode? txtObsFocusNode;
  TextEditingController? txtObsTextController;
  String? Function(BuildContext, String?)? txtObsTextControllerValidator;
  String? _txtObsTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Preencha alguma observação';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    txtDataReuniaoTextControllerValidator =
        _txtDataReuniaoTextControllerValidator;
    txtObsTextControllerValidator = _txtObsTextControllerValidator;
  }

  @override
  void dispose() {
    txtDataReuniaoFocusNode?.dispose();
    txtDataReuniaoTextController?.dispose();

    txtObsFocusNode?.dispose();
    txtObsTextController?.dispose();
  }
}
