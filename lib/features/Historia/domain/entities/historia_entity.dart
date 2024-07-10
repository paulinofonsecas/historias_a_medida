// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HistoriaEntity {
  final String id;
  final String nome;
  final String personagemPrincipal;
  final String coadjuvantes;
  final String descricao;
  final String categorias;
  final String historia;
  
  HistoriaEntity({
    required this.id,
    required this.nome,
    required this.personagemPrincipal,
    required this.coadjuvantes,
    required this.descricao,
    required this.categorias,
    required this.historia,
  });

  HistoriaEntity copyWith({
    String? id,
    String? nome,
    String? personagemPrincipal,
    String? coadjuvantes,
    String? descricao,
    String? categorias,
    String? historia,
  }) {
    return HistoriaEntity(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      personagemPrincipal: personagemPrincipal ?? this.personagemPrincipal,
      coadjuvantes: coadjuvantes ?? this.coadjuvantes,
      descricao: descricao ?? this.descricao,
      categorias: categorias ?? this.categorias,
      historia: historia ?? this.historia,
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
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoriaEntity.fromJson(String source) =>
      HistoriaEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HistoriaEntity(id: $id, nome: $nome, personagemPrincipal: $personagemPrincipal, coadjuvantes: $coadjuvantes, descricao: $descricao, categorias: $categorias, historia: $historia)';
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
        other.historia == historia;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nome.hashCode ^
        personagemPrincipal.hashCode ^
        coadjuvantes.hashCode ^
        descricao.hashCode ^
        categorias.hashCode ^
        historia.hashCode;
  }
}
