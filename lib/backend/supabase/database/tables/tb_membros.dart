import '../database.dart';

class TbMembrosTable extends SupabaseTable<TbMembrosRow> {
  @override
  String get tableName => 'tb_membros';

  @override
  TbMembrosRow createRow(Map<String, dynamic> data) => TbMembrosRow(data);
}

class TbMembrosRow extends SupabaseDataRow {
  TbMembrosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TbMembrosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  DateTime? get datanasc => getField<DateTime>('datanasc');
  set datanasc(DateTime? value) => setField<DateTime>('datanasc', value);

  bool? get batizado => getField<bool>('batizado');
  set batizado(bool? value) => setField<bool>('batizado', value);

  DateTime? get databatiz => getField<DateTime>('databatiz');
  set databatiz(DateTime? value) => setField<DateTime>('databatiz', value);

  String? get telefone => getField<String>('telefone');
  set telefone(String? value) => setField<String>('telefone', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get endereco => getField<String>('endereco');
  set endereco(String? value) => setField<String>('endereco', value);

  String? get complemento => getField<String>('complemento');
  set complemento(String? value) => setField<String>('complemento', value);

  String? get bairro => getField<String>('bairro');
  set bairro(String? value) => setField<String>('bairro', value);

  String? get cidade => getField<String>('cidade');
  set cidade(String? value) => setField<String>('cidade', value);

  String? get obs => getField<String>('obs');
  set obs(String? value) => setField<String>('obs', value);

  String? get pedidoora => getField<String>('pedidoora');
  set pedidoora(String? value) => setField<String>('pedidoora', value);

  bool? get ativo => getField<bool>('ativo');
  set ativo(bool? value) => setField<bool>('ativo', value);
}
