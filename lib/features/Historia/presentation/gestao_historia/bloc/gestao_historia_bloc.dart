import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:historias_a_medida/features/Historia/domain/entities/historia_entity.dart';
import 'package:historias_a_medida/features/Historia/domain/use_cases/get_historias_usecase.dart';
import 'package:historias_a_medida/utils/dependencies.dart';

part 'gestao_historia_event.dart';
part 'gestao_historia_state.dart';

class GestaoHistoriaBloc
    extends Bloc<GestaoHistoriaEvent, GestaoHistoriaState> {
  GestaoHistoriaBloc() : super(const GestaoHistoriaInitial()) {
    on<CustomGestaoHistoriaEvent>(_onCustomGestaoHistoriaEvent);
    on<GetAllHistorias>(_onGetAllHistorias);
  }

  FutureOr<void> _onCustomGestaoHistoriaEvent(
    CustomGestaoHistoriaEvent event,
    Emitter<GestaoHistoriaState> emit,
  ) {}

  FutureOr<void> _onGetAllHistorias(
    GetAllHistorias event,
    Emitter<GestaoHistoriaState> emit,
  ) {
    emit(const GestaoHistoriaLoading());

    final getHistoriasUC = getIt<GetHistoriasUsecase>();

    getHistoriasUC().then((historias) {
      emit(GestaoHistoriaSuccess(historias));
    }).catchError((_) {
      emit(const GestaoHistoriaError('Erro ao buscar historias'));
    });
  }
}
