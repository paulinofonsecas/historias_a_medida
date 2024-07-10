part of 'gestao_historia_bloc.dart';

abstract class GestaoHistoriaEvent extends Equatable {
  const GestaoHistoriaEvent();

  @override
  List<Object> get props => [];
}

/// {@template custom_gestao_historia_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomGestaoHistoriaEvent extends GestaoHistoriaEvent {
  /// {@macro custom_gestao_historia_event}
  const CustomGestaoHistoriaEvent();
}

class GetAllHistorias extends GestaoHistoriaEvent {
  /// {@macro custom_gestao_historia_event}
  const GetAllHistorias();
}
