import 'package:basic_grocery_app/features/home/model/product_model.dart';
import 'package:basic_grocery_app/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';

class WishlistCard extends StatelessWidget {
  final ProductDataModel product;
  final WishlistBloc wishlistBloc;

  const WishlistCard({
    super.key,
    required this.product,
    required this.wishlistBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                product.imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, size: 60),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(
                    product.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Text('Price: \$${product.price}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    /*homeBloc.add(HomeAddItemToWishListButtonEvent(
                        clickedProduct: product));*/
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    /*homeBloc.add(HomeProductCartButtonClickedEvent(
                        clickedProduct: product));*/
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
