import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crud_app_using_bloc/data/network_caller.dart';
import 'package:crud_app_using_bloc/data/network_response.dart';
import 'package:crud_app_using_bloc/model/product_model.dart';
import 'package:crud_app_using_bloc/utils/urls.dart';
import 'package:meta/meta.dart';

part 'add_event.dart';
part 'add_state.dart';

class AddBloc extends Bloc<AddEvent, AddState> {
  AddBloc() : super(AddInitial()) {
    on<AddProductEvent>(addProductEvent);
  }
  FutureOr<void> addProductEvent(
      AddProductEvent event, Emitter<AddState> emit) async {
    emit(AddLoadingState());
    final NetworkResponse response = await NetworkCaller.postRequest(
        Urls.createProduct, event.product.toJson());
    if (response.isSuccess) {
      emit(AddSuccessState());
    } else {
      emit(AddErrorState(errorMessage: response.errorMessage.toString()));
    }
  }
}
