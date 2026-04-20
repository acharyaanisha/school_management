import 'package:flutter_bloc/flutter_bloc.dart';
part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavInitial());
  int pageIndex = 0;

  setPageIndex(int currIndex) {
    pageIndex = currIndex;
    emit(BottomNavbarTapState(currIndex: currIndex));
  }

  int getPageIndex() {
    return pageIndex;
  }

  void hideNavBar() {
    emit(BottomNavbarTapState(currIndex: pageIndex, isVisible: false));
  }

  void showNavBar() {
    emit(BottomNavbarTapState(currIndex: pageIndex, isVisible: true));
  }
}
