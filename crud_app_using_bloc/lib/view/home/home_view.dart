import 'package:crud_app_using_bloc/utils/app_bar_builder.dart';
import 'package:crud_app_using_bloc/utils/app_navigator.dart';
import 'package:crud_app_using_bloc/view/add/add_view.dart';
import 'package:crud_app_using_bloc/view/home/bloc/home_bloc.dart';
import 'package:crud_app_using_bloc/view/product/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeBloc homeBloc = HomeBloc();
  final ProductBloc productBloc = ProductBloc();

  @override
  void initState() {
    super.initState();
    productBloc.add(ProductFetchEvent()); // 🔁 fetch products on load
  }

  @override
  void dispose() {
    homeBloc.close();
    productBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<HomeBloc, HomeState>(
          bloc: homeBloc,
          listenWhen: (previous, current) => current is HomeActionState,
          listener: (context, state) {
            if (state is HomeToAddViewNavigateState) {
              AppNavigator.pushTo(context, AddView());
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: appBarBuilder(
          context,
          "Crud App Using Bloc",
          icon: Icons.add,
          onTap: () {
            homeBloc.add(HomeToAddViewNavigateEvent());
          },
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          bloc: productBloc,
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductLoadSuccessState) {
              return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 2,
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        child: Icon(Icons.inventory_2, color: Colors.white),
                      ),
                      title: Text(product.productName ?? "No name"),
                      subtitle:
                          Text("৳ ${product.unitPrice?.toString() ?? "N/A"}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.green),
                            onPressed: () {
                              // TODO: Handle Edit logic
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              // TODO: Handle Delete logic
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is ProductErrorState) {
              return Center(child: Text("Error: ${state.errorMessage}"));
            } else {
              return const Center(child: Text("No products found."));
            }
          },
        ),
      ),
    );
  }
}
