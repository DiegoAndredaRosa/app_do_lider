// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/core/app_utils.dart';

class DTlistaMembrosStruct extends BaseStruct {
  DTlistaMembrosStruct({
    String? nome,
    int? idMembro,
    bool? checkBoxState,
    String? radioBtnState,
    bool? radioBtnmarcado,
  })  : _nome = nome,
        _idMembro = idMembro,
        _checkBoxState = checkBoxState,
        _radioBtnState = radioBtnState,
        _radioBtnmarcado = radioBtnmarcado;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "idMembro" field.
  int? _idMembro;
  int get idMembro => _idMembro ?? 0;
  set idMembro(int? val) => _idMembro = val;

  void incrementIdMembro(int amount) => idMembro = idMembro + amount;

  bool hasIdMembro() => _idMembro != null;

  // "checkBoxState" field.
  bool? _checkBoxState;
  bool get checkBoxState => _checkBoxState ?? false;
  set checkBoxState(bool? val) => _checkBoxState = val;

  bool hasCheckBoxState() => _checkBoxState != null;

  // "RadioBtnState" field.
  String? _radioBtnState;
  String get radioBtnState => _radioBtnState ?? '';
  set radioBtnState(String? val) => _radioBtnState = val;

  bool hasRadioBtnState() => _radioBtnState != null;

  // "RadioBtnmarcado" field.
  bool? _radioBtnmarcado;
  bool get radioBtnmarcado => _radioBtnmarcado ?? false;
  set radioBtnmarcado(bool? val) => _radioBtnmarcado = val;

  bool hasRadioBtnmarcado() => _radioBtnmarcado != null;

  static DTlistaMembrosStruct fromMap(Map<String, dynamic> data) =>
      DTlistaMembrosStruct(
        nome: data['nome'] as String?,
        idMembro: castToType<int>(data['idMembro']),
        checkBoxState: data['checkBoxState'] as bool?,
        radioBtnState: data['RadioBtnState'] as String?,
        radioBtnmarcado: data['RadioBtnmarcado'] as bool?,
      );

  static DTlistaMembrosStruct? maybeFromMap(dynamic data) => data is Map
      ? DTlistaMembrosStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nome': _nome,
        'idMembro': _idMembro,
        'checkBoxState': _checkBoxState,
        'RadioBtnState': _radioBtnState,
        'RadioBtnmarcado': _radioBtnmarcado,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'idMembro': serializeParam(
          _idMembro,
          ParamType.int,
        ),
        'checkBoxState': serializeParam(
          _checkBoxState,
          ParamType.bool,
        ),
        'RadioBtnState': serializeParam(
          _radioBtnState,
          ParamType.String,
        ),
        'RadioBtnmarcado': serializeParam(
          _radioBtnmarcado,
          ParamType.bool,
        ),
      }.withoutNulls;

  static DTlistaMembrosStruct fromSerializableMap(Map<String, dynamic> data) =>
      DTlistaMembrosStruct(
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        idMembro: deserializeParam(
          data['idMembro'],
          ParamType.int,
          false,
        ),
        checkBoxState: deserializeParam(
          data['checkBoxState'],
          ParamType.bool,
          false,
        ),
        radioBtnState: deserializeParam(
          data['RadioBtnState'],
          ParamType.String,
          false,
        ),
        radioBtnmarcado: deserializeParam(
          data['RadioBtnmarcado'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'DTlistaMembrosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DTlistaMembrosStruct &&
        nome == other.nome &&
        idMembro == other.idMembro &&
        checkBoxState == other.checkBoxState &&
        radioBtnState == other.radioBtnState &&
        radioBtnmarcado == other.radioBtnmarcado;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([nome, idMembro, checkBoxState, radioBtnState, radioBtnmarcado]);
}

DTlistaMembrosStruct createDTlistaMembrosStruct({
  String? nome,
  int? idMembro,
  bool? checkBoxState,
  String? radioBtnState,
  bool? radioBtnmarcado,
}) =>
    DTlistaMembrosStruct(
      nome: nome,
      idMembro: idMembro,
      checkBoxState: checkBoxState,
      radioBtnState: radioBtnState,
      radioBtnmarcado: radioBtnmarcado,
    );
