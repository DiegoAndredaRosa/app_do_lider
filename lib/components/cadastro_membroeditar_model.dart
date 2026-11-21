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
import 'cadastro_membroeditar_widget.dart' show CadastroMembroeditarWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class CadastroMembroeditarModel extends AppModel<CadastroMembroeditarWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtNomeMembro widget.
  FocusNode? txtNomeMembroFocusNode;
  TextEditingController? txtNomeMembroTextController;
  String? Function(BuildContext, String?)? txtNomeMembroTextControllerValidator;
  // State field(s) for txtDataNascMembroEdit widget.
  FocusNode? txtDataNascMembroEditFocusNode;
  TextEditingController? txtDataNascMembroEditTextController;
  late MaskTextInputFormatter txtDataNascMembroEditMask;
  String? Function(BuildContext, String?)?
      txtDataNascMembroEditTextControllerValidator;
  DateTime? datePicked1;
  // State field(s) for DpBatizadoEdit widget.
  bool? dpBatizadoEditValue;
  FormFieldController<bool>? dpBatizadoEditValueController;
  // State field(s) for txtBatizadoDataMembroEdit widget.
  FocusNode? txtBatizadoDataMembroEditFocusNode;
  TextEditingController? txtBatizadoDataMembroEditTextController;
  late MaskTextInputFormatter txtBatizadoDataMembroEditMask;
  String? Function(BuildContext, String?)?
      txtBatizadoDataMembroEditTextControllerValidator;
  DateTime? datePicked2;
  // State field(s) for txtTelefone widget.
  FocusNode? txtTelefoneFocusNode;
  TextEditingController? txtTelefoneTextController;
  late MaskTextInputFormatter txtTelefoneMask;
  String? Function(BuildContext, String?)? txtTelefoneTextControllerValidator;
  // State field(s) for txtEmail widget.
  FocusNode? txtEmailFocusNode;
  TextEditingController? txtEmailTextController;
  String? Function(BuildContext, String?)? txtEmailTextControllerValidator;
  // State field(s) for txtEndereco widget.
  FocusNode? txtEnderecoFocusNode;
  TextEditingController? txtEnderecoTextController;
  String? Function(BuildContext, String?)? txtEnderecoTextControllerValidator;
  // State field(s) for txtComplemento widget.
  FocusNode? txtComplementoFocusNode;
  TextEditingController? txtComplementoTextController;
  String? Function(BuildContext, String?)?
      txtComplementoTextControllerValidator;
  // State field(s) for txtBairro widget.
  FocusNode? txtBairroFocusNode;
  TextEditingController? txtBairroTextController;
  String? Function(BuildContext, String?)? txtBairroTextControllerValidator;
  // State field(s) for txtCidade widget.
  FocusNode? txtCidadeFocusNode;
  TextEditingController? txtCidadeTextController;
  String? Function(BuildContext, String?)? txtCidadeTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtNomeMembroFocusNode?.dispose();
    txtNomeMembroTextController?.dispose();

    txtDataNascMembroEditFocusNode?.dispose();
    txtDataNascMembroEditTextController?.dispose();

    txtBatizadoDataMembroEditFocusNode?.dispose();
    txtBatizadoDataMembroEditTextController?.dispose();

    txtTelefoneFocusNode?.dispose();
    txtTelefoneTextController?.dispose();

    txtEmailFocusNode?.dispose();
    txtEmailTextController?.dispose();

    txtEnderecoFocusNode?.dispose();
    txtEnderecoTextController?.dispose();

    txtComplementoFocusNode?.dispose();
    txtComplementoTextController?.dispose();

    txtBairroFocusNode?.dispose();
    txtBairroTextController?.dispose();

    txtCidadeFocusNode?.dispose();
    txtCidadeTextController?.dispose();
  }
}
