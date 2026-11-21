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

bool formataBooleanAusentePresente(String status) {
  if (status == 'Presente') {
    return true;
  } else if (status == 'Ausente') {
    return false;
  } else
    return false;
}
