import '../database.dart';

class VwPresencaTable extends SupabaseTable<VwPresencaRow> {
  @override
  String get tableName => 'vw_presenca';

  @override
  VwPresencaRow createRow(Map<String, dynamic> data) => VwPresencaRow(data);
}

class VwPresencaRow extends SupabaseDataRow {
  VwPresencaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VwPresencaTable();

  int? get presencaId => getField<int>('presenca_id');
  set presencaId(int? value) => setField<int>('presenca_id', value);

  int? get chamadaId => getField<int>('chamada_id');
  set chamadaId(int? value) => setField<int>('chamada_id', value);

  int? get membroId => getField<int>('membro_id');
  set membroId(int? value) => setField<int>('membro_id', value);

  String? get presencaObs => getField<String>('presenca_obs');
  set presencaObs(String? value) => setField<String>('presenca_obs', value);

  bool? get presencaStatus => getField<bool>('presenca_status');
  set presencaStatus(bool? value) => setField<bool>('presenca_status', value);

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);
}
