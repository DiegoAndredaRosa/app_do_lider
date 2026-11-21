import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/menu_lateral_widget.dart';
import '/components/radio_btn_componente_widget.dart';
import '/core/app_enums.dart';
import '/core/app_icon_button.dart';
import '/core/app_theme.dart';
import '/core/app_utils.dart';
import '/core/app_widgets.dart';
import '/core/instant_timer.dart';
import 'dart:ui';
import '/core/custom_functions.dart' as functions;
import 'g_r_membros_lista_chamada_radios_widget.dart'
    show GRMembrosListaChamadaRadiosWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GRMembrosListaChamadaRadiosModel
    extends AppModel<GRMembrosListaChamadaRadiosWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in GRMembrosListaChamadaRadios widget.
  List<VwGrMembrosRow>? listaOrdenadaSalvar;
  InstantTimer? instantTimer2;
  // Model for MenuLateral component.
  late MenuLateralModel menuLateralModel;
  // Models for RadioBtnComponente dynamic component.
  late AppDynamicModels<RadioBtnComponenteModel> radioBtnComponenteModels;
  InstantTimer? instantTimerSalvar;

  @override
  void initState(BuildContext context) {
    menuLateralModel = createAppModel(context, () => MenuLateralModel());
    radioBtnComponenteModels =
        AppDynamicModels(() => RadioBtnComponenteModel());
  }

  @override
  void dispose() {
    instantTimer2?.cancel();
    menuLateralModel.dispose();
    radioBtnComponenteModels.dispose();
    instantTimerSalvar?.cancel();
  }
}
