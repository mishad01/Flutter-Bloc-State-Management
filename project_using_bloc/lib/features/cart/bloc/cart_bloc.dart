import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_using_bloc/data/cart_items.dart';
import 'package:project_using_bloc/features/home/model/home_product_data_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<CartInitialEvent>(cartInitialEvent);
  }

  Future<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) async {
    emit(CartSuccessState(cartItems: cartItem));
  }
}
