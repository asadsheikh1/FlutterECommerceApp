import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/widgets/custom_app_bar.dart';
import 'package:shop_app/widgets/hero_carousel.dart';

class ProductScreen extends StatelessWidget {
  final Product? product;

  const ProductScreen({super.key, this.product});
  static const String routeName = '/product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: product!.name),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: ListView(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: [
                HeroCarousel(
                  product: product,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    alignment: Alignment.bottomCenter,
                    color: Colors.black.withAlpha(50),
                  ),
                  Container(
                    margin: EdgeInsets.all(5.0),
                    width: MediaQuery.of(context).size.width - 10,
                    height: 50,
                    color: Colors.black,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product!.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(color: Colors.white),
                          ),
                          Text(
                            '\$${product!.price.toString()}',
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ExpansionTile(
                initiallyExpanded: true,
                title: Text(
                  'Product Information',
                  style: Theme.of(context).textTheme.headline3,
                ),
                children: [
                  ListTile(
                    title: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ExpansionTile(
                initiallyExpanded: true,
                title: Text(
                  'Product Information',
                  style: Theme.of(context).textTheme.headline3,
                ),
                children: [
                  ListTile(
                    title: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {},
                color: Colors.white,
              ),
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {},
                color: Colors.white,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: Text(
                  'ADD TO CART',
                  style: Theme.of(context).textTheme.headline3,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
