import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/core/app_radio_button.dart';
import '/core/app_theme.dart';
import '/core/app_utils.dart';
import '/core/app_widgets.dart';
import '/core/form_field_controller.dart';
import 'dart:ui';
import 'radio_btn_componente_widget.dart' show RadioBtnComponenteWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RadioBtnComponenteModel extends AppModel<RadioBtnComponenteWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for RadioBtnPresencaComp widget.
  FormFieldController<String>? radioBtnPresencaCompValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get radioBtnPresencaCompValue =>
      radioBtnPresencaCompValueController?.value;
}
