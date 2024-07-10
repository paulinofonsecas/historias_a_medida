part of 'bottom_nav_bar_cubit.dart';

sealed class BottomNavBarState extends Equatable {
  const BottomNavBarState(this.index);
  final int index;

  @override
  List<Object> get props => [index];
}

final class BottomNavBarInitial extends BottomNavBarState {
  const BottomNavBarInitial(super.index);
}

final class BottomNavBarChanged extends BottomNavBarState {
  const BottomNavBarChanged(super.index);
}
