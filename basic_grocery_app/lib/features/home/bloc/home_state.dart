part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState {}

// UI states
final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class GroceryLoadSuccessState extends HomeState {
  final List<ProductDataModel> products;
  GroceryLoadSuccessState({required this.products});
}

// Action states (for navigation etc.)
final class HomeWishlistNavigateState extends HomeActionState {}

final class HomeCartListNavigateState extends HomeActionState {}

final class HomeAddProductToCartListState extends HomeActionState {}

final class HomeAddProductToWishListState extends HomeActionState {}
