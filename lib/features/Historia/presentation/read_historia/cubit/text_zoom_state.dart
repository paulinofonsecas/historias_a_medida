part of 'text_zoom_cubit.dart';

sealed class TextZoomState extends Equatable {
  const TextZoomState(this.zoom);

  final double zoom;

  @override
  List<Object> get props => [zoom];
}

final class TextZoomInitial extends TextZoomState {
  const TextZoomInitial(super.zoom);
}

final class TextZoomChanged extends TextZoomState {
  const TextZoomChanged(super.zoom);
}
