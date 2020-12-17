import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:navigation_drawer/pages/homePage.dart';
import 'package:navigation_drawer/pages/logout_page.dart';
import 'package:navigation_drawer/pages/myAccount_page.dart';
import 'package:navigation_drawer/pages/myOrders_page.dart';
import 'package:navigation_drawer/pages/settings_page.dart';
import 'package:navigation_drawer/pages/wish_list_page.dart';

part 'navigation_event.dart';

part 'navigation_state.dart';


class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(MyAccountPage());

  @override
  Stream<NavigationState> mapEventToState(
    NavigationEvent event,
  ) async* {
    switch (event.runtimeType) {
      case HomePageClickedEvent:
        yield HomePage();
        break;
      case MyAccountsClickedEvent:
        yield MyAccountPage();
        break;
      case MyOrdersClickedEvent:
        yield MyOrdersPage();
        break;
      case WishListClickedEvent:
        yield WishListPage();
        break;
      case SettingClickedEvent:
        yield SettingPage();
        break;
      case LogoutClickedEvent:
        yield LogoutPage();
        break;
    }
  }
}
