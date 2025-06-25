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
  }
}
