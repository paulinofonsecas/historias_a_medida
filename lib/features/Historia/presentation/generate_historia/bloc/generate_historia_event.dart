part of 'generate_historia_bloc.dart';

abstract class GenerateHistoriaEvent extends Equatable {
  const GenerateHistoriaEvent();

  @override
  List<Object> get props => [];
}

/// {@template custom_generate_historia_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomGenerateHistoriaEvent extends GenerateHistoriaEvent {
  /// {@macro custom_generate_historia_event}
  const CustomGenerateHistoriaEvent();
}

class GenerateHistoriaSubmitted extends GenerateHistoriaEvent {
  /// {@macro custom_generate_historia_event}
  const GenerateHistoriaSubmitted();
}
