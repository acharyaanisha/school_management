part of 'bottom_nav_cubit.dart';

abstract class BottomNavState {}

class BottomNavInitial extends BottomNavState {}

class BottomNavbarTapState extends BottomNavState {
  final int currIndex;
  final bool isVisible;

  BottomNavbarTapState({required this.currIndex, this.isVisible = true});
}
