part of 'read_historia_bloc.dart';

abstract class ReadHistoriaEvent  extends Equatable {
  const ReadHistoriaEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_read_historia_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomReadHistoriaEvent extends ReadHistoriaEvent {
  /// {@macro custom_read_historia_event}
  const CustomReadHistoriaEvent();
}
