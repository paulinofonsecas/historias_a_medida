part of 'generate_historia_bloc.dart';

/// {@template generate_historia_state}
/// GenerateHistoriaState description
/// {@endtemplate}
class GenerateHistoriaState extends Equatable {
  /// {@macro generate_historia_state}
  const GenerateHistoriaState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current GenerateHistoriaState with property changes
  GenerateHistoriaState copyWith({
    String? customProperty,
  }) {
    return GenerateHistoriaState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template generate_historia_initial}
/// The initial state of GenerateHistoriaState
/// {@endtemplate}
class GenerateHistoriaInitial extends GenerateHistoriaState {
  /// {@macro generate_historia_initial}
  const GenerateHistoriaInitial() : super();
}

class GenerateHistoriaLoading extends GenerateHistoriaState {
  const GenerateHistoriaLoading() : super();
}

class GenerateHistoriaSuccess extends GenerateHistoriaState {
  /// {@macro generate_historia_initial}
  const GenerateHistoriaSuccess(this.historia) : super();

  final HistoriaEntity historia;

  @override
  List<Object> get props => [historia];
}

class GenerateHistoriaError extends GenerateHistoriaState {
  /// {@macro generate_historia_initial}
  const GenerateHistoriaError(this.error) : super();

  final String error;

  @override
  List<Object> get props => [error];
}
