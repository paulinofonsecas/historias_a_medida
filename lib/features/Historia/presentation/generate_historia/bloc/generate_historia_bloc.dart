import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:historias_a_medida/features/Historia/domain/entities/dimensao.dart';
import 'package:historias_a_medida/features/Historia/domain/entities/historia_entity.dart';
import 'package:historias_a_medida/features/Historia/domain/use_cases/add_historia_usecase.dart';
import 'package:historias_a_medida/features/Historia/presentation/generate_historia/models/historia_model.dart';
import 'package:historias_a_medida/utils/dependencies.dart';
import 'package:uuid/uuid.dart';

part 'generate_historia_event.dart';
part 'generate_historia_state.dart';

class GenerateHistoriaBloc
    extends Bloc<GenerateHistoriaEvent, GenerateHistoriaState> {
  GenerateHistoriaBloc() : super(const GenerateHistoriaInitial()) {
    on<CustomGenerateHistoriaEvent>(_onCustomGenerateHistoriaEvent);
    on<GenerateHistoriaSubmitted>(_onGenerateHistoriaSubmitted);

    historiaModel = HistoriaModel(
      nome: 'Aventuras na Centralidade Horizonte, Cuito, Bié, Angola',
      personagemPrincipal: 'Romão Job',
      coadjuvantes: 'Josefina Meti, Paulino Fonseca',
      descricao: 'Três colegas eletricistas resolvem um grande'
          ' problema de eletricidade na centralidade',
      categorias: 'Aventura, suspanse',
    );
  }

  final GlobalKey<FormState> formKey = GlobalKey();
  late HistoriaModel historiaModel;

  FutureOr<void> _onCustomGenerateHistoriaEvent(
    CustomGenerateHistoriaEvent event,
    Emitter<GenerateHistoriaState> emit,
  ) {}

  int dimensao(Dimensao dim) {
    if (dim == Dimensao.pequena) {
      return 250;
    } else if (dim == Dimensao.media) {
      return 500;
    } else {
      return 1000;
    }
  }

  FutureOr<void> _onGenerateHistoriaSubmitted(
    GenerateHistoriaSubmitted event,
    Emitter<GenerateHistoriaState> emit,
  ) async {
    emit(const GenerateHistoriaLoading());
    const apiKey = 'AIzaSyCnBdFte2GQXTQhpaX__2C_iMDSm0ScJyw';

    // comunicate with gemini ai
    final model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: apiKey,
    );

    final dim = dimensao(historiaModel.dimensao);

    final prompt = '''
      Crie uma historia infantil em portugues de $dim palavras; sem Markdown
      com base nos seguintes fatos:

      Fatos:
        nome: ${historiaModel.nome}
        personagemPrincipal: ${historiaModel.personagemPrincipal}
        coadjuvantes: ${historiaModel.coadjuvantes}
        descricao: ${historiaModel.descricao}
        categorias: ${historiaModel.categorias}

      Resposta:
      ''';

    final content = [Content.text(prompt)];
    final response = await model.generateContent(content);

    final entity = HistoriaEntity(
      id: const Uuid().v4(),
      nome: historiaModel.nome,
      personagemPrincipal: historiaModel.personagemPrincipal,
      coadjuvantes: historiaModel.coadjuvantes,
      descricao: historiaModel.descricao,
      categorias: historiaModel.categorias,
      historia: response.text ?? '',
      dimensao: historiaModel.dimensao,
    );

    final addHistoriaUsecase = getIt<AddHistoriaUsecase>();

    await addHistoriaUsecase(entity).then((value) {
      emit(GenerateHistoriaSuccess(entity));
    }).catchError((_) {
      emit(const GenerateHistoriaError('Erro ao criar história!'));
    });
  }
}
