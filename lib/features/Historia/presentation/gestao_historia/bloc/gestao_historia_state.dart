part of 'gestao_historia_bloc.dart';

/// {@template gestao_historia_state}
/// GestaoHistoriaState description
/// {@endtemplate}
class GestaoHistoriaState extends Equatable {
  /// {@macro gestao_historia_state}
  const GestaoHistoriaState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current GestaoHistoriaState with property changes
  GestaoHistoriaState copyWith({
    String? customProperty,
  }) {
    return GestaoHistoriaState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template gestao_historia_initial}
/// The initial state of GestaoHistoriaState
/// {@endtemplate}
class GestaoHistoriaInitial extends GestaoHistoriaState {
  /// {@macro gestao_historia_initial}
  const GestaoHistoriaInitial() : super();
}

class GestaoHistoriaLoading extends GestaoHistoriaState {
  const GestaoHistoriaLoading();
}

class GestaoHistoriaEmpty extends GestaoHistoriaState {
  const GestaoHistoriaEmpty();
}

class GestaoHistoriaSuccess extends GestaoHistoriaState {
  const GestaoHistoriaSuccess(this.historias);

  final List<HistoriaEntity> historias;

  @override
  List<Object> get props => [historias];
}

class GestaoHistoriaError extends GestaoHistoriaState {
  const GestaoHistoriaError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
