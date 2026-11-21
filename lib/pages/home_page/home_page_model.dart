import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/menu_lateral_widget.dart';
import '/core/app_enums.dart';
import '/core/app_icon_button.dart';
import '/core/app_theme.dart';
import '/core/app_utils.dart';
import '/core/app_widgets.dart';
import 'dart:ui';
import '/core/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends AppModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in HomePage widget.
  List<TbGrsRow>? listaGRs;
  // Stores action output result for [Supabase RPC - fn_dashboard_geral] action in HomePage widget.
  List<dynamic>? fnDashboardGeralResult;
  // Stores action output result for [Supabase RPC - fn_membros_por_grupo] action in HomePage widget.
  List<dynamic>? fnMembrosPorGrupoResult;
  // Stores action output result for [Supabase RPC - fn_top_presencas] action in HomePage widget.
  List<dynamic>? fnTopPresencasResult;
  // Stores action output result for [Supabase RPC - fn_menos_presencas] action in HomePage widget.
  List<dynamic>? fnMenosPresencasResult;
  // Stores action output result for [Supabase RPC - fn_proximo_aniversariante] action in HomePage widget.
  List<dynamic>? fnProximoAniversarianteResult;
  // Model for MenuLateral component.
  late MenuLateralModel menuLateralModel;

  @override
  void initState(BuildContext context) {
    menuLateralModel = createAppModel(context, () => MenuLateralModel());
  }

  @override
  void dispose() {
    menuLateralModel.dispose();
  }
}
