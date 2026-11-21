import '/auth/supabase_auth/auth_util.dart';
import '/core/app_theme.dart';
import '/core/app_utils.dart';
import '/core/app_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'menu_lateral_widget.dart' show MenuLateralWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuLateralModel extends AppModel<MenuLateralWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegionDash widget.
  bool mouseRegionDashHovered = false;
  // State field(s) for MouseRegionGr widget.
  bool mouseRegionGrHovered1 = false;
  // State field(s) for MouseRegionGr widget.
  bool mouseRegionGrHovered2 = false;
  // State field(s) for MouseRegionGr widget.
  bool mouseRegionGrHovered3 = false;
  // State field(s) for MouseRegionSair widget.
  bool mouseRegionSairHovered = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
