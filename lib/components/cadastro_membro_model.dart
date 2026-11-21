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
import 'cadastro_membro_widget.dart' show CadastroMembroWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CadastroMembroModel extends AppModel<CadastroMembroWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtNomeMembro widget.
  FocusNode? txtNomeMembroFocusNode;
  TextEditingController? txtNomeMembroTextController;
  String? Function(BuildContext, String?)? txtNomeMembroTextControllerValidator;
  String? _txtNomeMembroTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Insira o nome do membro';
    }

    return null;
  }

  // State field(s) for txtDataNascMembro widget.
  FocusNode? txtDataNascMembroFocusNode;
  TextEditingController? txtDataNascMembroTextController;
  late MaskTextInputFormatter txtDataNascMembroMask;
  String? Function(BuildContext, String?)?
      txtDataNascMembroTextControllerValidator;
  String? _txtDataNascMembroTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Preencha a data de nascimento';
    }

    return null;
  }

  DateTime? datePicked1;
  // State field(s) for dpBatizado widget.
  bool? dpBatizadoValue;
  FormFieldController<bool>? dpBatizadoValueController;
  // State field(s) for txtDataBatizado widget.
  FocusNode? txtDataBatizadoFocusNode;
  TextEditingController? txtDataBatizadoTextController;
  late MaskTextInputFormatter txtDataBatizadoMask;
  String? Function(BuildContext, String?)?
      txtDataBatizadoTextControllerValidator;
  DateTime? datePicked2;
  // State field(s) for txtTelefone widget.
  FocusNode? txtTelefoneFocusNode;
  TextEditingController? txtTelefoneTextController;
  late MaskTextInputFormatter txtTelefoneMask;
  String? Function(BuildContext, String?)? txtTelefoneTextControllerValidator;
  String? _txtTelefoneTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Preencha o telefone/WhatsApp';
    }

    return null;
  }

  // State field(s) for txtEmail widget.
  FocusNode? txtEmailFocusNode;
  TextEditingController? txtEmailTextController;
  String? Function(BuildContext, String?)? txtEmailTextControllerValidator;
  String? _txtEmailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Preencha o e-mail';
    }

    return null;
  }

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
  // Stores action output result for [Backend Call - Insert Row] action in btnSalvarMembro widget.
  TbMembrosRow? membroSalvo;

  @override
  void initState(BuildContext context) {
    txtNomeMembroTextControllerValidator =
        _txtNomeMembroTextControllerValidator;
    txtDataNascMembroTextControllerValidator =
        _txtDataNascMembroTextControllerValidator;
    txtTelefoneTextControllerValidator = _txtTelefoneTextControllerValidator;
    txtEmailTextControllerValidator = _txtEmailTextControllerValidator;
  }

  @override
  void dispose() {
    txtNomeMembroFocusNode?.dispose();
    txtNomeMembroTextController?.dispose();

    txtDataNascMembroFocusNode?.dispose();
    txtDataNascMembroTextController?.dispose();

    txtDataBatizadoFocusNode?.dispose();
    txtDataBatizadoTextController?.dispose();

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
