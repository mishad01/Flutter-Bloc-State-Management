import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crud_app_using_bloc/data/network_caller.dart';
import 'package:crud_app_using_bloc/data/network_response.dart';
import 'package:crud_app_using_bloc/model/product_list_model.dart';
import 'package:crud_app_using_bloc/model/product_model.dart';
import 'package:crud_app_using_bloc/utils/urls.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  List<ProductModel> _productList = [];
  ProductBloc() : super(ProductInitial()) {
    on<ProductFetchEvent>(productFetchEvent);
  }
  FutureOr<void> productFetchEvent(
      ProductFetchEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoadingState());

    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.getProducts);

    if (response.isSuccess) {
      final productListModel = ProductListModel.fromJson(response.responseData);
      _productList = productListModel.data ?? [];
      emit(ProductLoadSuccessState(products: _productList));
    } else {
      emit(ProductErrorState(errorMessage: response.errorMessage.toString()));
    }
  }
}
