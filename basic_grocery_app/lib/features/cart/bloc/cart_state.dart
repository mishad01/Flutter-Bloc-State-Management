part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

abstract class CartActionState extends CartState {}

class CartInitial extends CartState {}

class CartPaymentViewNavigateState extends CartActionState {}

class CartSuccessState extends CartState {
  final List<ProductDataModel> cartItems;
  CartSuccessState({required this.cartItems});
}

class CartItemRemoveState extends CartActionState {}
