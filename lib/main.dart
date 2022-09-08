import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shop_app/blocs/cart/cart_bloc.dart';
import 'package:shop_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:shop_app/config/theme.dart';
import 'package:shop_app/l10n/l10n.dart';
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
        supportedLocales: L10n.all,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
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
