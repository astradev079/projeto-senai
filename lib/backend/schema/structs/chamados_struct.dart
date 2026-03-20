// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChamadosStruct extends BaseStruct {
  ChamadosStruct({
    int? id,
    String? dataChamados,
    String? tipo,
    String? nome,
    String? descricao,
  })  : _id = id,
        _dataChamados = dataChamados,
        _tipo = tipo,
        _nome = nome,
        _descricao = descricao;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "data_chamados" field.
  String? _dataChamados;
  String get dataChamados => _dataChamados ?? '';
  set dataChamados(String? val) => _dataChamados = val;

  bool hasDataChamados() => _dataChamados != null;

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  set tipo(String? val) => _tipo = val;

  bool hasTipo() => _tipo != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  set descricao(String? val) => _descricao = val;

  bool hasDescricao() => _descricao != null;

  static ChamadosStruct fromMap(Map<String, dynamic> data) => ChamadosStruct(
        id: castToType<int>(data['id']),
        dataChamados: data['data_chamados'] as String?,
        tipo: data['tipo'] as String?,
        nome: data['nome'] as String?,
        descricao: data['descricao'] as String?,
      );

  static ChamadosStruct? maybeFromMap(dynamic data) =>
      data is Map ? ChamadosStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'data_chamados': _dataChamados,
        'tipo': _tipo,
        'nome': _nome,
        'descricao': _descricao,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'data_chamados': serializeParam(
          _dataChamados,
          ParamType.String,
        ),
        'tipo': serializeParam(
          _tipo,
          ParamType.String,
        ),
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'descricao': serializeParam(
          _descricao,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChamadosStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChamadosStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        dataChamados: deserializeParam(
          data['data_chamados'],
          ParamType.String,
          false,
        ),
        tipo: deserializeParam(
          data['tipo'],
          ParamType.String,
          false,
        ),
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        descricao: deserializeParam(
          data['descricao'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChamadosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChamadosStruct &&
        id == other.id &&
        dataChamados == other.dataChamados &&
        tipo == other.tipo &&
        nome == other.nome &&
        descricao == other.descricao;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, dataChamados, tipo, nome, descricao]);
}

ChamadosStruct createChamadosStruct({
  int? id,
  String? dataChamados,
  String? tipo,
  String? nome,
  String? descricao,
}) =>
    ChamadosStruct(
      id: id,
      dataChamados: dataChamados,
      tipo: tipo,
      nome: nome,
      descricao: descricao,
    );
