import 'package:basic_grocery_app/features/cart/ui/cart_view.dart';
import 'package:basic_grocery_app/features/home/bloc/home_bloc.dart';
import 'package:basic_grocery_app/features/home/ui/product_card_widget.dart';
import 'package:basic_grocery_app/features/wishlist/ui/wishlist_view.dart';
import 'package:basic_grocery_app/utils/app_bar_build.dart';
import 'package:basic_grocery_app/utils/app_navigator.dart';
import 'package:basic_grocery_app/utils/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeBloc.add(HomeInitialEvent());
    homeBloc.add(HomeLoadGroceryDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeWishlistNavigateState) {
          AppNavigator.pushTo(context, WishlistView());
        } else if (state is HomeCartListNavigateState) {
          AppNavigator.pushTo(context, CartView());
        } else if (state is HomeAddProductToCartListState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              'Item added to cart',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.green,
          ));
        } else if (state is HomeAddProductToWishListState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              'Item added to wish list',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          ));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          case GroceryLoadSuccessState:
            final successState = state as GroceryLoadSuccessState;
            return AppScaffold(
              appBar: AppBarBuild(
                title: "Grocery App Home",
                icon1: Icons.favorite_border,
                icon2: Icons.shopping_cart,
                onPressed1: () {
                  homeBloc.add(HomeWishListNavigationButtonEvent());
                },
                onPressed2: () {
                  homeBloc.add(HomeCartListNavigationButtonEvent());
                },
              ),
              body: ListView.builder(
                itemCount: successState.products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: successState.products[index],
                    homeBloc: homeBloc,
                  );
                },
              ),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}
