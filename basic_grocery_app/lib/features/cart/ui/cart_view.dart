import 'package:basic_grocery_app/utils/app_bar_build.dart';
import 'package:basic_grocery_app/utils/app_scaffol.dart';
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
        }
      },
      builder: (context, state) {
        return AppScaffold(
          appBar: AppBarBuild(
            title: "Cart",
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text("Noting Yet")),
              ElevatedButton(
                  onPressed: () {
                    cartBloc.add(CartPaymentButtonEvent());
                  },
                  child: Text("Proceed to payment")),
            ],
          ),
        );
      },
    );
  }
}
