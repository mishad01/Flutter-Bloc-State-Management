part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeWishListNavigationButtonEvent extends HomeEvent {}

class HomeCartListNavigationButtonEvent extends HomeEvent {}

class HomeLoadGroceryDataEvent extends HomeEvent {}

class HomeAddItemToCartListButtonEvent extends HomeEvent {
  final ProductDataModel clickedProduct;
  HomeAddItemToCartListButtonEvent({required this.clickedProduct});
}

class HomeAddItemToWishListButtonEvent extends HomeEvent {
  final ProductDataModel clickedProduct;
  HomeAddItemToWishListButtonEvent({required this.clickedProduct});
}
