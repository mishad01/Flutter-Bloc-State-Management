part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

class ProductActionState extends ProductState {}

final class ProductInitial extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadSuccessState extends ProductState {
  final List<ProductModel> products;
  ProductLoadSuccessState({required this.products});
}

class ProductErrorState extends ProductState {
  final String errorMessage;
  ProductErrorState({required this.errorMessage});
}

class ProductUpdateSuccessState extends ProductActionState {
  final String productId;
  ProductUpdateSuccessState(this.productId);
}
