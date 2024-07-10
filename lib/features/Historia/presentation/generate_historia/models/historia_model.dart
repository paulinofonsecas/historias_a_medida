import 'dart:convert';

class HistoriaModel {
  HistoriaModel({
    this.nome = '',
    this.personagemPrincipal = '',
    this.coadjuvantes = '',
    this.descricao = '',
    this.categorias = '',
  });

  factory HistoriaModel.fromMap(Map<String, dynamic> map) {
    return HistoriaModel(
      nome: map['nome'] as String,
      personagemPrincipal: map['personagemPrincipal'] as String,
      coadjuvantes: map['coadjuvantes'] as String,
      descricao: map['descricao'] as String,
      categorias: map['categorias'] as String,
    );
  }

  factory HistoriaModel.fromJson(String source) =>
      HistoriaModel.fromMap(json.decode(source) as Map<String, dynamic>);
  String nome;
  String personagemPrincipal;
  String coadjuvantes;
  String descricao;
  String categorias;

  HistoriaModel copyWith({
    String? nome,
    String? personagemPrincipal,
    String? coadjuvantes,
    String? descricao,
    String? categorias,
  }) {
    return HistoriaModel(
      nome: nome ?? this.nome,
      personagemPrincipal: personagemPrincipal ?? this.personagemPrincipal,
      coadjuvantes: coadjuvantes ?? this.coadjuvantes,
      descricao: descricao ?? this.descricao,
      categorias: categorias ?? this.categorias,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'personagemPrincipal': personagemPrincipal,
      'coadjuvantes': coadjuvantes,
      'descricao': descricao,
      'categorias': categorias,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return '_HistoriaModel(nome: $nome, personagemPrincipal: $personagemPrincipal, coadjuvantes: $coadjuvantes, descricao: $descricao, categorias: $categorias)';
  }

  @override
  bool operator ==(covariant HistoriaModel other) {
    if (identical(this, other)) return true;

    return other.nome == nome &&
        other.personagemPrincipal == personagemPrincipal &&
        other.coadjuvantes == coadjuvantes &&
        other.descricao == descricao &&
        other.categorias == categorias;
  }

  @override
  int get hashCode {
    return nome.hashCode ^
        personagemPrincipal.hashCode ^
        coadjuvantes.hashCode ^
        descricao.hashCode ^
        categorias.hashCode;
  }
}
