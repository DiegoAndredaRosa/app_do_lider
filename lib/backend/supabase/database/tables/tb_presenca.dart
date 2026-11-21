import '../database.dart';

class TbPresencaTable extends SupabaseTable<TbPresencaRow> {
  @override
  String get tableName => 'tb_presenca';

  @override
  TbPresencaRow createRow(Map<String, dynamic> data) => TbPresencaRow(data);
}

class TbPresencaRow extends SupabaseDataRow {
  TbPresencaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TbPresencaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get presencaObs => getField<String>('presenca_obs');
  set presencaObs(String? value) => setField<String>('presenca_obs', value);

  bool get presencaStatus => getField<bool>('presenca_status')!;
  set presencaStatus(bool value) => setField<bool>('presenca_status', value);

  int get chamadaId => getField<int>('chamada_id')!;
  set chamadaId(int value) => setField<int>('chamada_id', value);

  int get membroId => getField<int>('membro_id')!;
  set membroId(int value) => setField<int>('membro_id', value);
}
