part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishListButtonClickedEvent extends HomeEvent {}

class HomeProductCartButtonClickedEvent extends HomeEvent {}

class HomeWishlistButtonNavigateButtonClickedEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
