import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crud_practice/core/service/network_caller.dart';
import 'package:crud_practice/core/service/network_response.dart';
import 'package:crud_practice/core/utils/urls.dart';
import 'package:crud_practice/data/model/product/product_list_model.dart';
import 'package:crud_practice/data/model/product/product_model.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  List<ProductModel> _productList = [];
  ProductBloc() : super(ProductInitial()) {
    on<ProductFetchEvent>(_productFetchEvent);
    on<ProductDeleteEvent>(_productDeleteEvent);
  }
  FutureOr<void> _productFetchEvent(
      ProductFetchEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoadingState());
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.getProducts);
    if (response.isSuccess) {
      ProductListModel productListModel =
          ProductListModel.fromJson(response.responseData);
      _productList = productListModel.data ?? [];
      emit(ProductFetchSuccessState(productList: _productList));
    } else {
      emit(ProductFetchErrorState(
          errorMessage: response.errorMessage ?? "Unknown error"));
    }
  }

  FutureOr<void> _productDeleteEvent(
      ProductDeleteEvent event, Emitter<ProductState> emit) async {
    emit(ProductDeleteLoadingState(id: event.id));
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.deleteProduct(event.id));

    if (response.isSuccess) {
      /*_productList.removeWhere((element) => element.sId == event.id);
      emit(ProductFetchSuccessState(productList: _productList));*/
      _productList.removeWhere(
        (element) => element.sId == event.id,
      );
      emit(ProductFetchSuccessState(productList: _productList));
    } else {
      emit(ProductFetchErrorState(
          errorMessage: response.errorMessage ?? "Unknown error"));
    }
  }
}
