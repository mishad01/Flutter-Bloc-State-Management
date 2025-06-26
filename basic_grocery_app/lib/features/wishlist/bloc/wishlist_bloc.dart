import 'package:basic_grocery_app/data/wishlist_items.dart';
import 'package:basic_grocery_app/features/home/model/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>((event, emit) {
      emit(WishlistInitial());
      emit(WishListSuccessState(wishListItem: wishListItems));
    });

    on<WishListTestViewButtonEvent>(
      (event, emit) {
        emit(WishlistTestViewNavigationState());
      },
    );
  }
}
