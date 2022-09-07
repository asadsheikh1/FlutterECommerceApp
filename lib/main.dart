import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_app/blocs/cart/cart_bloc.dart';
import 'package:shop_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:shop_app/config/theme.dart';
import 'package:shop_app/screens/catalog_screen.dart';
import 'package:shop_app/screens/checkout_screen.dart';
import 'package:shop_app/screens/product_screen.dart';
import 'package:shop_app/screens/tabs_Screen.dart';
import 'package:shop_app/screens/wishlist_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist())),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'eCommerce App',
        theme: theme(),
        home: TabsScreen(),
        routes: {
          WishlistScreen.routeName: (context) => WishlistScreen(),
          ProductScreen.routeName: (context) => ProductScreen(),
          CatalogScreen.routeName: (context) => CatalogScreen(),
          CheckoutScreen.routeName: (context) => CheckoutScreen(),
        },
      ),
    );
  }
}
