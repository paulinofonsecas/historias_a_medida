part of 'read_historia_bloc.dart';

/// {@template read_historia_state}
/// ReadHistoriaState description
/// {@endtemplate}
class ReadHistoriaState extends Equatable {
  /// {@macro read_historia_state}
  const ReadHistoriaState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current ReadHistoriaState with property changes
  ReadHistoriaState copyWith({
    String? customProperty,
  }) {
    return ReadHistoriaState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template read_historia_initial}
/// The initial state of ReadHistoriaState
/// {@endtemplate}
class ReadHistoriaInitial extends ReadHistoriaState {
  /// {@macro read_historia_initial}
  const ReadHistoriaInitial() : super();
}
