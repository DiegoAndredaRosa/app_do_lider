import '../database.dart';

class TbGrMembrosTable extends SupabaseTable<TbGrMembrosRow> {
  @override
  String get tableName => 'tb_gr_membros';

  @override
  TbGrMembrosRow createRow(Map<String, dynamic> data) => TbGrMembrosRow(data);
}

class TbGrMembrosRow extends SupabaseDataRow {
  TbGrMembrosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TbGrMembrosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int get grId => getField<int>('gr_id')!;
  set grId(int value) => setField<int>('gr_id', value);

  int get membroId => getField<int>('membro_id')!;
  set membroId(int value) => setField<int>('membro_id', value);

  bool get ativo => getField<bool>('ativo')!;
  set ativo(bool value) => setField<bool>('ativo', value);
}
