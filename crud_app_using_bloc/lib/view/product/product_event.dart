part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class ProductFetchEvent extends ProductEvent {}

class ProductAddEvent extends ProductEvent {
  final ProductModel product;
  ProductAddEvent(this.product);
}

class ProductUpdateEvent extends ProductEvent {}

class ProductDeleteEvent extends ProductEvent {}
