import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_using_bloc/features/cart/bloc/cart_bloc.dart';
import 'package:project_using_bloc/features/cart/ui/cart_product_widget.dart';
import 'package:project_using_bloc/features/home/model/home_product_data_model.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    super.initState();
    cartBloc.add(CartInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {
          // Handle side effects here if needed
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return ListView.builder(
                itemCount: successState.cartItems.length,
                itemBuilder: (context, index) {
                  ProductDataModel product = successState.cartItems[index];
                  return CartCard(product: product, cartBloc: cartBloc);
                },
              );

            default:
              return const SizedBox(); // Or a fallback UI
          }
        },
      ),
    );
  }
}
