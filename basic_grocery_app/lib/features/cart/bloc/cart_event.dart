part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartPaymentButtonEvent extends CartEvent {}

class CartItemFetchEvent extends CartEvent {}

/*class CartAddItemEvent extends CartEvent {
  final ProductDataModel product;
  CartAddItemEvent({required this.product});
}*/
