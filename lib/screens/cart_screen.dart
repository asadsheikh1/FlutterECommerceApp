import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/blocs/cart/cart_bloc.dart';
import 'package:shop_app/screens/checkout_screen.dart';
import 'package:shop_app/widgets/cart_product_card.dart';
import 'package:shop_app/widgets/order_summary.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is CartLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.cart.freeDeliveryString,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(),
                              elevation: 0,
                            ),
                            child: Text(
                              'Add More Items',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CartProductCard(
                          product: state.cart
                              .productQuantity(state.cart.products)
                              .keys
                              .elementAt(index),
                          quantity: state.cart
                              .productQuantity(state.cart.products)
                              .values
                              .elementAt(index),
                        );
                      },
                      itemCount: state.cart
                          .productQuantity(state.cart.products)
                          .keys
                          .length,
                    ),
                  ),
                  OrderSummary(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        CheckoutScreen.routeName,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(),
                      elevation: 0,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'GO TO CHECKOUT',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Text('Something went wrong.');
          }
        },
      ),
    );
  }
}
