import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/core/custom_functions.dart';
import '/core/models/lat_lng.dart';
import '/core/models/place.dart';
import '/core/models/uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/core/app_enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

DateTime? formataData(String? datatxt) {
  if (datatxt == null || datatxt.isEmpty) {
    return null;
  }

  final partes = datatxt.split('/');

  if (partes.length != 3) {
    print('Formato inválido: $datatxt');
    return null;
  }

  return DateTime(
    int.parse(partes[2]),
    int.parse(partes[1]),
    int.parse(partes[0]),
  );
}
