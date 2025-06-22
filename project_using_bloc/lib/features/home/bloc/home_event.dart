part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeProductWishListButtonClickedEvent extends HomeEvent {}

class HomeProductCartButtonClickedEvent extends HomeEvent {}

class HomeWishlistButtonNavigateButtonClickedEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
