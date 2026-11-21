import '../database.dart';

class TbGrsTable extends SupabaseTable<TbGrsRow> {
  @override
  String get tableName => 'tb_grs';

  @override
  TbGrsRow createRow(Map<String, dynamic> data) => TbGrsRow(data);
}

class TbGrsRow extends SupabaseDataRow {
  TbGrsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TbGrsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get grnome => getField<String>('grnome');
  set grnome(String? value) => setField<String>('grnome', value);

  String get usuarioId => getField<String>('usuario_id')!;
  set usuarioId(String value) => setField<String>('usuario_id', value);

  bool? get ativo => getField<bool>('ativo');
  set ativo(bool? value) => setField<bool>('ativo', value);
}
