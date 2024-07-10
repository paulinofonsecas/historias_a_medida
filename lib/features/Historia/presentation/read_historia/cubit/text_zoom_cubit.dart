import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'text_zoom_state.dart';

class TextZoomCubit extends Cubit<TextZoomState> {
  TextZoomCubit() : super(const TextZoomInitial(25));

  void zoomIn() {
    emit(TextZoomChanged(state.zoom + 1));
  }

  void zoomOut() {
    emit(TextZoomChanged(state.zoom - 1));
  }
}
