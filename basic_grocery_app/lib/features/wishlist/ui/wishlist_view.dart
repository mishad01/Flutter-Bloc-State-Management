import 'package:basic_grocery_app/features/payement/ui/test_view.dart';
import 'package:basic_grocery_app/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:basic_grocery_app/features/wishlist/ui/wishlist_card.dart';
import 'package:basic_grocery_app/utils/app_bar_build.dart';
import 'package:basic_grocery_app/utils/app_navigator.dart';
import 'package:basic_grocery_app/utils/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    super.initState();
    wishlistBloc.add(WishlistInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistBloc, WishlistState>(
      bloc: wishlistBloc,
      listenWhen: (previous, current) => current is WishlistActionState,
      buildWhen: (previous, current) => current is! WishlistActionState,
      listener: (context, state) {
        if (state is WishlistTestViewNavigationState) {
          AppNavigator.pushTo(context, const TestView());
        }
      },
      builder: (context, state) {
        if (state is WishListSuccessState) {
          return AppScaffold(
            appBar: const AppBarBuild(title: "Wishlist"),
            body: ListView.builder(
              itemCount: state.wishListItem.length,
              itemBuilder: (context, index) {
                final product = state.wishListItem[index];
                return WishlistCard(
                    product: product,
                    wishlistBloc: wishlistBloc); // custom widget
              },
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
