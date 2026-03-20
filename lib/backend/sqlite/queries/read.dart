import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN REQUISICAO
Future<List<RequisicaoRow>> performRequisicao(
  Database database,
) {
  final query = '''
SELECT * from chamados
''';
  return _readQuery(database, query, (d) => RequisicaoRow(d));
}

class RequisicaoRow extends SqliteRow {
  RequisicaoRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  String get dataChamado => data['data_chamado']?.toString() ?? '';
  String get tipo => data['tipo']?.toString() ?? '';
  String get nome => data['nome']?.toString() ?? '';
  String get descricao => data['descricao']?.toString() ?? '';
}

/// END REQUISICAO
