import 'package:sqflite/sqflite.dart';

/// BEGIN ADICIONAR
Future performAdicionar(
  Database database, {
  String? nome,
  String? tipo,
  String? descricao,
}) {
  final query = '''
INSERT INTO chamados (tipo, nome, descricao)
VALUES (?, ?, ?)
''';
  return database.rawInsert(query, [tipo, nome, descricao]);
}

/// END ADICIONAR
