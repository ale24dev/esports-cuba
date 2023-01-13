import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../constants/nav_bar_items.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(NavbarItem.home, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(const NavigationState(NavbarItem.home, 0));
        break;
      case NavbarItem.tournament:
        emit(const NavigationState(NavbarItem.tournament, 1));
        break;
      default:
        emit(const NavigationState(NavbarItem.profile, 2));
        break;
    }
  }
}
