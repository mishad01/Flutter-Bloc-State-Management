import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_using_bloc/features/cart/ui/cart.dart';
import 'package:project_using_bloc/features/home/bloc/home_bloc.dart';
import 'package:project_using_bloc/features/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        } else if (state is HomeNavigateToWishListPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Wishlist()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text(
              "Mishad's Grocery App",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeProductWishListButtonClickedEvent());
                  },
                  icon: Icon(Icons.favorite_border)),
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeProductCartButtonClickedEvent());
                  },
                  icon: Icon(Icons.shopping_bag_outlined)),
            ],
          ),
        );
      },
    );
  }
}
