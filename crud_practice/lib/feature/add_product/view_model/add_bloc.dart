import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crud_practice/core/service/network_caller.dart';
import 'package:crud_practice/core/service/network_response.dart';
import 'package:crud_practice/core/utils/urls.dart';
import 'package:crud_practice/data/model/product/product_model.dart';
import 'package:meta/meta.dart';

part 'add_event.dart';
part 'add_state.dart';

class AddBloc extends Bloc<AddEvent, AddState> {
  AddBloc() : super(AddInitial()) {
    on<AddProductEvent>(_addProductEvent);
  }
  FutureOr<void> _addProductEvent(
      AddProductEvent event, Emitter<AddState> emit) async {
    emit(AddLoadingState());
    final NetworkResponse response = await NetworkCaller.postRequest(
        Urls.createProduct, event.product.toJson());

    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.responseData}');
    print('Response Success: ${response.isSuccess}');
    print(event.product.toJson());

    if (response.isSuccess) {
      emit(AddProductSuccessState());
    } else {
      emit(
        AddProductErrorState(
            errorMessage:
                'Failed: ${response.responseData ?? 'Unknown error'}'),
      );
    }
  }
}
