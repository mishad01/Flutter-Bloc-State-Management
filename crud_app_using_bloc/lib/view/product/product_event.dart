part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class ProductFetchEvent extends ProductEvent {}

class ProductAddEvent extends ProductEvent {
  final ProductModel product;
  ProductAddEvent(this.product);
}

class ProductUpdateEvent extends ProductEvent {
  final String id;
  final ProductModel productModel;
  ProductUpdateEvent(this.productModel, this.id);
}

class ProductDeleteEvent extends ProductEvent {
  final String id;
  ProductDeleteEvent(this.id);
}
