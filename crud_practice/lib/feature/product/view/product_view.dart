import 'package:crud_practice/core/utils/app_navigator.dart';
import 'package:crud_practice/feature/add_product/view/add_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_bar_builder.dart';
import '../../../core/utils/base_scaffold.dart';
import '../view_model/product_bloc.dart';
import '../widget/prduct_card.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  ProductBloc productBloc = ProductBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productBloc.add(ProductFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      bloc: productBloc,
      listenWhen: (previous, current) => current is ProductActionState,
      buildWhen: (previous, current) => true,
      listener: (context, state) {
        if (state is ProductViewToAddViewNavigation) {
          AppNavigator.pushTo(context, AddView());
        }
      },
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return BaseScaffold(
              widget: Center(child: CircularProgressIndicator()));
        } else if (state is ProductFetchSuccessState) {
          final productList = state.productList;
          return BaseScaffold(
              appBar: appBarBuilder(
                context,
                "Crud App Using Bloc",
                icon: Icons.add,
                onTap: () {
                  productBloc.add(ProductViewToAddViewNavigationEvent());
                },
              ),
              widget: ListView.builder(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: productList[index],
                    productBloc: productBloc,
                  );
                },
              ));
        } else {
          return Container();
        }
      },
    );
  }
}
