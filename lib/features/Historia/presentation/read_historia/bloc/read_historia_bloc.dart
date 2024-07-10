import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'read_historia_event.dart';
part 'read_historia_state.dart';

class ReadHistoriaBloc extends Bloc<ReadHistoriaEvent, ReadHistoriaState> {
  ReadHistoriaBloc() : super(const ReadHistoriaInitial()) {
    on<CustomReadHistoriaEvent>(_onCustomReadHistoriaEvent);
  }

  FutureOr<void> _onCustomReadHistoriaEvent(
    CustomReadHistoriaEvent event,
    Emitter<ReadHistoriaState> emit,
  ) {
    // TODO: Add Logic
  }
}
