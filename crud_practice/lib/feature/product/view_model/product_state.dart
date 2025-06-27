part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductActionState extends ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoadingState extends ProductState {}

final class ProductFetchSuccessState extends ProductState {
  final List<ProductModel> productList;
  ProductFetchSuccessState({required this.productList});
}

final class ProductFetchErrorState extends ProductState {
  final String errorMessage;
  ProductFetchErrorState({this.errorMessage = "Something went wrong"});
}

final class ProductDeleteState extends ProductState {
  final String id;
  ProductDeleteState({required this.id});
}

final class ProductDeleteLoadingState extends ProductState {
  final String id;
  ProductDeleteLoadingState({required this.id});
}
