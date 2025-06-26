part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartPaymentButtonEvent extends CartEvent {}

class CartItemFetchEvent extends CartEvent {}

class CartItemRemoveEvent extends CartEvent {
  final ProductDataModel product;
  CartItemRemoveEvent({required this.product});
}
