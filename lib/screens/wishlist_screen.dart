import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/widgets/product_card.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});
  static const String routeName = '/wishlist';

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.15,
      ),
      itemBuilder: (context, index) {
        return Center(
          child: ProductCard(
            product: Product.products[index],
            widthFactor: 2.2,
          ),
        );
      },
      itemCount: Product.products.length,
    );
  }
}
