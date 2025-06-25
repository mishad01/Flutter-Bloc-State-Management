import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_using_bloc/data/cart_items.dart';
import 'package:project_using_bloc/data/grocery_data.dart';
import 'package:project_using_bloc/data/wishlist_items.dart';
import 'package:project_using_bloc/features/home/model/home_product_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);

    on<HomeProductWishListButtonClickedEvent>(
      homeProductWishListButtonClickedEvent,
    );

    on<HomeProductCartButtonClickedEvent>(
      homeProductCartButtonClickedEvent,
    );
    on<HomeCartButtonNavigateEvent>(
      homeCartButtonNavigateEvent,
    );
    on<HomeWishlistButtonNavigateButtonClickedEvent>(
      homeWishlistButtonNavigateButtonClickedEvent,
    );
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        product: GroceryData.groceryProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }

  FutureOr<void> homeProductWishListButtonClickedEvent(
      HomeProductWishListButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Wish List Clicked");
    wishlistItem.add(event.clickedProduct);
    emit(HomeProductItemCartListedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Cart List Clicked");
    cartItem.add(event.clickedProduct);
    emit(HomeProductItemWishListedActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("Cart Button Navigate Clicked");
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateButtonClickedEvent(
      HomeWishlistButtonNavigateButtonClickedEvent event,
      Emitter<HomeState> emit) {
    print("Wish List  Button Navigate Clicked");
    emit(HomeNavigateToWishListPageActionState());
  }
}
