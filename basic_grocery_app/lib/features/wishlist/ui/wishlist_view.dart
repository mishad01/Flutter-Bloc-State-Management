import 'package:basic_grocery_app/features/payement/ui/test_view.dart';
import 'package:basic_grocery_app/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:basic_grocery_app/utils/app_bar_build.dart';
import 'package:basic_grocery_app/utils/app_navigator.dart';
import 'package:basic_grocery_app/utils/app_scaffol.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  @override
  Widget build(BuildContext context) {
    WishlistBloc wishlistBloc = WishlistBloc();
    return BlocConsumer<WishlistBloc, WishlistState>(
      bloc: wishlistBloc,
      listenWhen: (previous, current) => current is WishlistActionState,
      buildWhen: (previous, current) => current is! WishlistActionState,
      listener: (context, state) {
        if (state is WishlistTestViewNavigationState) {
          AppNavigator.pushTo(context, TestView());
        }
      },
      builder: (context, state) {
        return AppScaffold(
          appBar: AppBarBuild(
            title: "Wishlist",
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text("Noting Yet"),
              ),
              ElevatedButton(
                  onPressed: () {
                    wishlistBloc.add(WishListTestViewButtonEvent());
                  },
                  child: Text("Test View"))
            ],
          ),
        );
      },
    );
  }
}
