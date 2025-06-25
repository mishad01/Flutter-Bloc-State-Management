part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeWishListNavigationButtonEvent extends HomeEvent {}

class HomeCartListNavigationButtonEvent extends HomeEvent {}

class LoadGroceryDataEvent extends HomeEvent {}
