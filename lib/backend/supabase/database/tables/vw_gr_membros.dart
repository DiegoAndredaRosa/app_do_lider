import '../database.dart';

class VwGrMembrosTable extends SupabaseTable<VwGrMembrosRow> {
  @override
  String get tableName => 'vw_gr_membros';

  @override
  VwGrMembrosRow createRow(Map<String, dynamic> data) => VwGrMembrosRow(data);
}

class VwGrMembrosRow extends SupabaseDataRow {
  VwGrMembrosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VwGrMembrosTable();

  int? get grMembroId => getField<int>('gr_membro_id');
  set grMembroId(int? value) => setField<int>('gr_membro_id', value);

  int? get grId => getField<int>('gr_id');
  set grId(int? value) => setField<int>('gr_id', value);

  int? get membroId => getField<int>('membro_id');
  set membroId(int? value) => setField<int>('membro_id', value);

  bool? get ativo => getField<bool>('ativo');
  set ativo(bool? value) => setField<bool>('ativo', value);

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

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
}
