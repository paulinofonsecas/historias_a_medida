// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:historias_a_medida/features/Historia/domain/entities/dimensao.dart';

class HistoriaModel {
  String nome;
  String personagemPrincipal;
  String coadjuvantes;
  String descricao;
  String categorias;
  Dimensao dimensao;

  HistoriaModel({
    this.nome = '',
    this.personagemPrincipal = '',
    this.coadjuvantes = '',
    this.descricao = '',
    this.categorias = '',
    this.dimensao = Dimensao.pequena,
  });

  HistoriaModel copyWith({
    String? nome,
    String? personagemPrincipal,
    String? coadjuvantes,
    String? descricao,
    String? categorias,
    Dimensao? dimensao,
  }) {
    return HistoriaModel(
      nome: nome ?? this.nome,
      personagemPrincipal: personagemPrincipal ?? this.personagemPrincipal,
      coadjuvantes: coadjuvantes ?? this.coadjuvantes,
      descricao: descricao ?? this.descricao,
      categorias: categorias ?? this.categorias,
      dimensao: dimensao ?? this.dimensao,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'personagemPrincipal': personagemPrincipal,
      'coadjuvantes': coadjuvantes,
      'descricao': descricao,
      'categorias': categorias,
      'dimensao': dimensao.name,
    };
  }

  factory HistoriaModel.fromMap(Map<String, dynamic> map) {
    return HistoriaModel(
      nome: map['nome'] as String,
      personagemPrincipal: map['personagemPrincipal'] as String,
      coadjuvantes: map['coadjuvantes'] as String,
      descricao: map['descricao'] as String,
      categorias: map['categorias'] as String,
      dimensao: Dimensao.values.byName(map['dimensao'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoriaModel.fromJson(String source) =>
      HistoriaModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HistoriaModel(nome: $nome, personagemPrincipal: $personagemPrincipal, coadjuvantes: $coadjuvantes, descricao: $descricao, categorias: $categorias, dimensao: $dimensao)';
  }

  @override
  bool operator ==(covariant HistoriaModel other) {
    if (identical(this, other)) return true;

    return other.nome == nome &&
        other.personagemPrincipal == personagemPrincipal &&
        other.coadjuvantes == coadjuvantes &&
        other.descricao == descricao &&
        other.categorias == categorias &&
        other.dimensao == dimensao;
  }

  @override
  int get hashCode {
    return nome.hashCode ^
        personagemPrincipal.hashCode ^
        coadjuvantes.hashCode ^
        descricao.hashCode ^
        categorias.hashCode ^
        dimensao.hashCode;
  }
}
