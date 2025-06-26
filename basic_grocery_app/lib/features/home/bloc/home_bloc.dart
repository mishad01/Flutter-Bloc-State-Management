import 'package:basic_grocery_app/data/cart_items.dart';
import 'package:basic_grocery_app/data/grocery_data.dart';
import 'package:basic_grocery_app/data/wishlist_items.dart';
import 'package:basic_grocery_app/features/home/model/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>((event, emit) async {
      emit(HomeInitial());
    });

    on<HomeLoadGroceryDataEvent>((event, emit) async {
      emit(HomeLoadingState()); // Show loading UI immediately
      await Future.delayed(Duration(seconds: 2));
      emit(GroceryLoadSuccessState(
          products: GroceryData.groceryProducts
              .map(
                (e) => ProductDataModel(
                  id: e['id'],
                  name: e['name'],
                  description: e['description'],
                  price: e['price'],
                  imageUrl: e['imageUrl'],
                ),
              )
              .toList()));
    });

    on<HomeWishListNavigationButtonEvent>((event, emit) {
      emit(HomeWishlistNavigateState());
    });

    on<HomeCartListNavigationButtonEvent>(
      (event, emit) {
        emit(HomeCartListNavigateState());
      },
    );
    on<HomeAddItemToCartListButtonEvent>(
      (event, emit) {
        print("Wish icon clicked");
        cartItems.add(event.clickedProduct);
        emit(HomeAddProductToCartListState());
      },
    );

    on<HomeAddItemToWishListButtonEvent>(
      (event, emit) {
        print("Wish icon clicked");
        wishListItems.add(event.clickedProduct);
        emit(HomeAddProductToWishListState());
      },
    );
  }
}
