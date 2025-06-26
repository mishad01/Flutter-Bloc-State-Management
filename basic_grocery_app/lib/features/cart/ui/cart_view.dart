import 'package:basic_grocery_app/features/cart/ui/cart_card_widget.dart';
import 'package:basic_grocery_app/utils/app_bar_build.dart';
import 'package:basic_grocery_app/utils/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/app_navigator.dart';
import '../../payement/ui/payment_view.dart';
import '../bloc/cart_bloc.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    super.initState();
    cartBloc.add(CartInitialEvent());
    cartBloc.add(CartItemFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      bloc: cartBloc,
      listenWhen: (previous, current) => current is CartActionState,
      buildWhen: (previous, current) => current is! CartActionState,
      listener: (context, state) {
        if (state is CartPaymentViewNavigateState) {
          AppNavigator.pushTo(context, const PaymentView());
        } else if (state is CartItemRemoveState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              'Item removed',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.green,
          ));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case CartSuccessState:
            final successState = state as CartSuccessState;
            return AppScaffold(
              appBar: AppBarBuild(
                title: "Cart",
              ),
              body: ListView.builder(
                itemCount: successState.cartItems.length,
                itemBuilder: (context, index) {
                  return CartCard(
                    product: successState.cartItems[index],
                    cartBloc: cartBloc,
                  );
                },
              ),
            );
          default:
        }
        return SizedBox();
      },
    );
  }
}
