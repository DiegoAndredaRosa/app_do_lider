import '../database.dart';

class TbUsuariosTable extends SupabaseTable<TbUsuariosRow> {
  @override
  String get tableName => 'tb_usuarios';

  @override
  TbUsuariosRow createRow(Map<String, dynamic> data) => TbUsuariosRow(data);
}

class TbUsuariosRow extends SupabaseDataRow {
  TbUsuariosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TbUsuariosTable();

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);
}
