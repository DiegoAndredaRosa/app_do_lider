import '../database.dart';

class TbChamadaTable extends SupabaseTable<TbChamadaRow> {
  @override
  String get tableName => 'tb_chamada';

  @override
  TbChamadaRow createRow(Map<String, dynamic> data) => TbChamadaRow(data);
}

class TbChamadaRow extends SupabaseDataRow {
  TbChamadaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TbChamadaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int get chamadaGrId => getField<int>('chamada_gr_id')!;
  set chamadaGrId(int value) => setField<int>('chamada_gr_id', value);

  DateTime? get chamadaData => getField<DateTime>('chamada_data');
  set chamadaData(DateTime? value) => setField<DateTime>('chamada_data', value);

  String? get obs => getField<String>('obs');
  set obs(String? value) => setField<String>('obs', value);

  bool? get chamadaFeita => getField<bool>('chamada_feita');
  set chamadaFeita(bool? value) => setField<bool>('chamada_feita', value);
}
