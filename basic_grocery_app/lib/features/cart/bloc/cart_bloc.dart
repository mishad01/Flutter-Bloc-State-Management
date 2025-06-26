import 'package:basic_grocery_app/data/cart_items.dart';
import 'package:basic_grocery_app/features/home/model/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>((event, emit) {
      emit(CartInitial());
    });

    on<CartPaymentButtonEvent>(
      (event, emit) {
        emit(CartPaymentViewNavigateState());
      },
    );

    on<CartItemFetchEvent>(
      (event, emit) {
        emit(CartSuccessState(cartItems: cartItems));
      },
    );
  }
}
