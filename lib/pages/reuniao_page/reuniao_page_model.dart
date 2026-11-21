import '/backend/supabase/supabase.dart';
import '/components/cadastro_reuniao_widget.dart';
import '/components/menu_lateral_widget.dart';
import '/core/app_enums.dart';
import '/core/app_icon_button.dart';
import '/core/app_theme.dart';
import '/core/app_utils.dart';
import '/core/app_widgets.dart';
import 'dart:ui';
import '/core/custom_functions.dart' as functions;
import '/index.dart';
import 'reuniao_page_widget.dart' show ReuniaoPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReuniaoPageModel extends AppModel<ReuniaoPageWidget> {
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
