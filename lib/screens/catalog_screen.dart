import 'package:flutter/material.dart';
import 'package:shop_app/models/category.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/widgets/custom_app_bar.dart';
import 'package:shop_app/widgets/product_card.dart';

class CatalogScreen extends StatelessWidget {
  final Category? category;

  const CatalogScreen({super.key, this.category});
  static const String routeName = '/catalog';

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products
        .where((product) => product.category == category?.name)
        .toList();

    return Scaffold(
      appBar: CustomAppBar(title: category!.name),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.15,
          ),
          itemBuilder: (context, index) {
            return Center(
              child: ProductCard(
                product: categoryProducts[index],
                widthFactor: 2.2,
              ),
            );
          },
          itemCount: categoryProducts.length,
        ),
      ),
    );
  }
}
