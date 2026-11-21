import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/menu_lateral_widget.dart';
import '/core/app_enums.dart';
import '/core/app_icon_button.dart';
import '/core/app_theme.dart';
import '/core/app_utils.dart';
import '/core/app_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'g_rs_lista_chamada_widget.dart' show GRsListaChamadaWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GRsListaChamadaModel extends AppModel<GRsListaChamadaWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MenuLateral component.
  late MenuLateralModel menuLateralModel;
  // State field(s) for MouseRegionSair widget.
  bool mouseRegionSairHovered = false;

  @override
  void initState(BuildContext context) {
    menuLateralModel = createAppModel(context, () => MenuLateralModel());
  }

  @override
  void dispose() {
    menuLateralModel.dispose();
  }
}
