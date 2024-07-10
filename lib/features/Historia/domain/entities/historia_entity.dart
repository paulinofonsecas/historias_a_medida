// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:historias_a_medida/features/Historia/domain/entities/dimensao.dart';

class HistoriaEntity {
  final String id;
  final String nome;
  final String personagemPrincipal;
  final String coadjuvantes;
  final String descricao;
  final String categorias;
  final String historia;
  final Dimensao dimensao;

  HistoriaEntity({
    required this.id,
    required this.nome,
    required this.personagemPrincipal,
    required this.coadjuvantes,
    required this.descricao,
    required this.categorias,
    required this.historia,
    required this.dimensao,
  });

  HistoriaEntity copyWith({
    String? id,
    String? nome,
    String? personagemPrincipal,
    String? coadjuvantes,
    String? descricao,
    String? categorias,
    String? historia,
    Dimensao? dimensao,
  }) {
    return HistoriaEntity(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      personagemPrincipal: personagemPrincipal ?? this.personagemPrincipal,
      coadjuvantes: coadjuvantes ?? this.coadjuvantes,
      descricao: descricao ?? this.descricao,
      categorias: categorias ?? this.categorias,
      historia: historia ?? this.historia,
      dimensao: dimensao ?? this.dimensao,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'personagemPrincipal': personagemPrincipal,
      'coadjuvantes': coadjuvantes,
      'descricao': descricao,
      'categorias': categorias,
      'historia': historia,
      'dimensao': dimensao.name,
    };
  }

  factory HistoriaEntity.fromMap(Map<String, dynamic> map) {
    return HistoriaEntity(
      id: map['id'] as String,
      nome: map['nome'] as String,
      personagemPrincipal: map['personagemPrincipal'] as String,
      coadjuvantes: map['coadjuvantes'] as String,
      descricao: map['descricao'] as String,
      categorias: map['categorias'] as String,
      historia: map['historia'] as String,
      dimensao: Dimensao.values.byName(map['dimensao'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoriaEntity.fromJson(String source) =>
      HistoriaEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HistoriaEntity(id: $id, nome: $nome, personagemPrincipal: $personagemPrincipal, coadjuvantes: $coadjuvantes, descricao: $descricao, categorias: $categorias, historia: $historia, dimensao: $dimensao)';
  }

  @override
  bool operator ==(covariant HistoriaEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nome == nome &&
        other.personagemPrincipal == personagemPrincipal &&
        other.coadjuvantes == coadjuvantes &&
        other.descricao == descricao &&
        other.categorias == categorias &&
        other.historia == historia &&
        other.dimensao == dimensao;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nome.hashCode ^
        personagemPrincipal.hashCode ^
        coadjuvantes.hashCode ^
        descricao.hashCode ^
        categorias.hashCode ^
        historia.hashCode ^
        dimensao.hashCode;
  }
}
