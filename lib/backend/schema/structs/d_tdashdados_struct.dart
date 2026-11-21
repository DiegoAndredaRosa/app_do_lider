// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/core/app_utils.dart';

class DTdashdadosStruct extends BaseStruct {
  DTdashdadosStruct({
    int? totalGrsdt,
    int? totalMembrosdt,
    int? membrosAtivosdt,
    int? membrosInativosdt,
    int? totalReunioesdt,
    int? totalPresencasdt,
    int? totalFaltasdt,
    double? percentualPresencadt,
    DateTime? ultimaReuniaodt,
    DateTime? proximaReuniaodt,
  })  : _totalGrsdt = totalGrsdt,
        _totalMembrosdt = totalMembrosdt,
        _membrosAtivosdt = membrosAtivosdt,
        _membrosInativosdt = membrosInativosdt,
        _totalReunioesdt = totalReunioesdt,
        _totalPresencasdt = totalPresencasdt,
        _totalFaltasdt = totalFaltasdt,
        _percentualPresencadt = percentualPresencadt,
        _ultimaReuniaodt = ultimaReuniaodt,
        _proximaReuniaodt = proximaReuniaodt;

  // "total_grsdt" field.
  int? _totalGrsdt;
  int get totalGrsdt => _totalGrsdt ?? 0;
  set totalGrsdt(int? val) => _totalGrsdt = val;

  void incrementTotalGrsdt(int amount) => totalGrsdt = totalGrsdt + amount;

  bool hasTotalGrsdt() => _totalGrsdt != null;

  // "total_membrosdt" field.
  int? _totalMembrosdt;
  int get totalMembrosdt => _totalMembrosdt ?? 0;
  set totalMembrosdt(int? val) => _totalMembrosdt = val;

  void incrementTotalMembrosdt(int amount) =>
      totalMembrosdt = totalMembrosdt + amount;

  bool hasTotalMembrosdt() => _totalMembrosdt != null;

  // "membros_ativosdt" field.
  int? _membrosAtivosdt;
  int get membrosAtivosdt => _membrosAtivosdt ?? 0;
  set membrosAtivosdt(int? val) => _membrosAtivosdt = val;

  void incrementMembrosAtivosdt(int amount) =>
      membrosAtivosdt = membrosAtivosdt + amount;

  bool hasMembrosAtivosdt() => _membrosAtivosdt != null;

  // "membros_inativosdt" field.
  int? _membrosInativosdt;
  int get membrosInativosdt => _membrosInativosdt ?? 0;
  set membrosInativosdt(int? val) => _membrosInativosdt = val;

  void incrementMembrosInativosdt(int amount) =>
      membrosInativosdt = membrosInativosdt + amount;

  bool hasMembrosInativosdt() => _membrosInativosdt != null;

  // "total_reunioesdt" field.
  int? _totalReunioesdt;
  int get totalReunioesdt => _totalReunioesdt ?? 0;
  set totalReunioesdt(int? val) => _totalReunioesdt = val;

  void incrementTotalReunioesdt(int amount) =>
      totalReunioesdt = totalReunioesdt + amount;

  bool hasTotalReunioesdt() => _totalReunioesdt != null;

  // "total_presencasdt" field.
  int? _totalPresencasdt;
  int get totalPresencasdt => _totalPresencasdt ?? 0;
  set totalPresencasdt(int? val) => _totalPresencasdt = val;

  void incrementTotalPresencasdt(int amount) =>
      totalPresencasdt = totalPresencasdt + amount;

  bool hasTotalPresencasdt() => _totalPresencasdt != null;

  // "total_faltasdt" field.
  int? _totalFaltasdt;
  int get totalFaltasdt => _totalFaltasdt ?? 0;
  set totalFaltasdt(int? val) => _totalFaltasdt = val;

  void incrementTotalFaltasdt(int amount) =>
      totalFaltasdt = totalFaltasdt + amount;

  bool hasTotalFaltasdt() => _totalFaltasdt != null;

  // "percentual_presencadt" field.
  double? _percentualPresencadt;
  double get percentualPresencadt => _percentualPresencadt ?? 0.0;
  set percentualPresencadt(double? val) => _percentualPresencadt = val;

  void incrementPercentualPresencadt(double amount) =>
      percentualPresencadt = percentualPresencadt + amount;

  bool hasPercentualPresencadt() => _percentualPresencadt != null;

  // "ultima_reuniaodt" field.
  DateTime? _ultimaReuniaodt;
  DateTime? get ultimaReuniaodt => _ultimaReuniaodt;
  set ultimaReuniaodt(DateTime? val) => _ultimaReuniaodt = val;

  bool hasUltimaReuniaodt() => _ultimaReuniaodt != null;

  // "proxima_reuniaodt" field.
  DateTime? _proximaReuniaodt;
  DateTime? get proximaReuniaodt => _proximaReuniaodt;
  set proximaReuniaodt(DateTime? val) => _proximaReuniaodt = val;

  bool hasProximaReuniaodt() => _proximaReuniaodt != null;

  static DTdashdadosStruct fromMap(Map<String, dynamic> data) =>
      DTdashdadosStruct(
        totalGrsdt: castToType<int>(data['total_grsdt']),
        totalMembrosdt: castToType<int>(data['total_membrosdt']),
        membrosAtivosdt: castToType<int>(data['membros_ativosdt']),
        membrosInativosdt: castToType<int>(data['membros_inativosdt']),
        totalReunioesdt: castToType<int>(data['total_reunioesdt']),
        totalPresencasdt: castToType<int>(data['total_presencasdt']),
        totalFaltasdt: castToType<int>(data['total_faltasdt']),
        percentualPresencadt: castToType<double>(data['percentual_presencadt']),
        ultimaReuniaodt: data['ultima_reuniaodt'] as DateTime?,
        proximaReuniaodt: data['proxima_reuniaodt'] as DateTime?,
      );

  static DTdashdadosStruct? maybeFromMap(dynamic data) => data is Map
      ? DTdashdadosStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'total_grsdt': _totalGrsdt,
        'total_membrosdt': _totalMembrosdt,
        'membros_ativosdt': _membrosAtivosdt,
        'membros_inativosdt': _membrosInativosdt,
        'total_reunioesdt': _totalReunioesdt,
        'total_presencasdt': _totalPresencasdt,
        'total_faltasdt': _totalFaltasdt,
        'percentual_presencadt': _percentualPresencadt,
        'ultima_reuniaodt': _ultimaReuniaodt,
        'proxima_reuniaodt': _proximaReuniaodt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'total_grsdt': serializeParam(
          _totalGrsdt,
          ParamType.int,
        ),
        'total_membrosdt': serializeParam(
          _totalMembrosdt,
          ParamType.int,
        ),
        'membros_ativosdt': serializeParam(
          _membrosAtivosdt,
          ParamType.int,
        ),
        'membros_inativosdt': serializeParam(
          _membrosInativosdt,
          ParamType.int,
        ),
        'total_reunioesdt': serializeParam(
          _totalReunioesdt,
          ParamType.int,
        ),
        'total_presencasdt': serializeParam(
          _totalPresencasdt,
          ParamType.int,
        ),
        'total_faltasdt': serializeParam(
          _totalFaltasdt,
          ParamType.int,
        ),
        'percentual_presencadt': serializeParam(
          _percentualPresencadt,
          ParamType.double,
        ),
        'ultima_reuniaodt': serializeParam(
          _ultimaReuniaodt,
          ParamType.DateTime,
        ),
        'proxima_reuniaodt': serializeParam(
          _proximaReuniaodt,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static DTdashdadosStruct fromSerializableMap(Map<String, dynamic> data) =>
      DTdashdadosStruct(
        totalGrsdt: deserializeParam(
          data['total_grsdt'],
          ParamType.int,
          false,
        ),
        totalMembrosdt: deserializeParam(
          data['total_membrosdt'],
          ParamType.int,
          false,
        ),
        membrosAtivosdt: deserializeParam(
          data['membros_ativosdt'],
          ParamType.int,
          false,
        ),
        membrosInativosdt: deserializeParam(
          data['membros_inativosdt'],
          ParamType.int,
          false,
        ),
        totalReunioesdt: deserializeParam(
          data['total_reunioesdt'],
          ParamType.int,
          false,
        ),
        totalPresencasdt: deserializeParam(
          data['total_presencasdt'],
          ParamType.int,
          false,
        ),
        totalFaltasdt: deserializeParam(
          data['total_faltasdt'],
          ParamType.int,
          false,
        ),
        percentualPresencadt: deserializeParam(
          data['percentual_presencadt'],
          ParamType.double,
          false,
        ),
        ultimaReuniaodt: deserializeParam(
          data['ultima_reuniaodt'],
          ParamType.DateTime,
          false,
        ),
        proximaReuniaodt: deserializeParam(
          data['proxima_reuniaodt'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'DTdashdadosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DTdashdadosStruct &&
        totalGrsdt == other.totalGrsdt &&
        totalMembrosdt == other.totalMembrosdt &&
        membrosAtivosdt == other.membrosAtivosdt &&
        membrosInativosdt == other.membrosInativosdt &&
        totalReunioesdt == other.totalReunioesdt &&
        totalPresencasdt == other.totalPresencasdt &&
        totalFaltasdt == other.totalFaltasdt &&
        percentualPresencadt == other.percentualPresencadt &&
        ultimaReuniaodt == other.ultimaReuniaodt &&
        proximaReuniaodt == other.proximaReuniaodt;
  }

  @override
  int get hashCode => const ListEquality().hash([
        totalGrsdt,
        totalMembrosdt,
        membrosAtivosdt,
        membrosInativosdt,
        totalReunioesdt,
        totalPresencasdt,
        totalFaltasdt,
        percentualPresencadt,
        ultimaReuniaodt,
        proximaReuniaodt
      ]);
}

DTdashdadosStruct createDTdashdadosStruct({
  int? totalGrsdt,
  int? totalMembrosdt,
  int? membrosAtivosdt,
  int? membrosInativosdt,
  int? totalReunioesdt,
  int? totalPresencasdt,
  int? totalFaltasdt,
  double? percentualPresencadt,
  DateTime? ultimaReuniaodt,
  DateTime? proximaReuniaodt,
}) =>
    DTdashdadosStruct(
      totalGrsdt: totalGrsdt,
      totalMembrosdt: totalMembrosdt,
      membrosAtivosdt: membrosAtivosdt,
      membrosInativosdt: membrosInativosdt,
      totalReunioesdt: totalReunioesdt,
      totalPresencasdt: totalPresencasdt,
      totalFaltasdt: totalFaltasdt,
      percentualPresencadt: percentualPresencadt,
      ultimaReuniaodt: ultimaReuniaodt,
      proximaReuniaodt: proximaReuniaodt,
    );
