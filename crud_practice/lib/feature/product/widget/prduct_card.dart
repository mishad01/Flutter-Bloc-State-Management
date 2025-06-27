import 'package:crud_practice/data/model/product/product_model.dart';
import 'package:crud_practice/feature/product/view_model/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final ProductBloc productBloc;

  const ProductCard({
    super.key,
    required this.product,
    required this.productBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: const CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.inventory_2, color: Colors.white),
        ),
        title: Text(
          product.productName ?? "No name",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Code: ${product.productCode ?? 'N/A'}"),
            Text("Unit Price: ৳${product.unitPrice ?? 'N/A'}"),
            Text("Quantity: ${product.qty ?? 'N/A'}"),
            Text("Total Price: ৳${product.totalPrice ?? 'N/A'}"),
          ],
        ),
        trailing: Wrap(
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.green),
              onPressed: () {},
            ),
            BlocBuilder<ProductBloc, ProductState>(
              bloc: productBloc,
              builder: (context, state) {
                if (state is ProductDeleteLoadingState) {
                  return const CircularProgressIndicator();
                } else {
                  return IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      productBloc
                          .add(ProductDeleteEvent(id: product.sId ?? ''));
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
