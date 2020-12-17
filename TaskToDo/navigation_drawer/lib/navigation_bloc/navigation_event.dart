part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent {}

class HomePageClickedEvent extends NavigationEvent {}

class MyAccountsClickedEvent extends NavigationEvent {}

class MyOrdersClickedEvent extends NavigationEvent {}

class SettingClickedEvent extends NavigationEvent {}

class WishListClickedEvent extends NavigationEvent {}

class LogoutClickedEvent extends NavigationEvent {}



