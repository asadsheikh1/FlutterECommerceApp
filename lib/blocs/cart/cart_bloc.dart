import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/models/product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading());

  Stream<CartState> mapEventToState(CartEvent event) async* {
    try {
      if (event is CartStarted) {
        yield* _mapCartStartedEventToState();
      } else if (event is CartProductAdded) {
        yield* _mapCartProductAddedEventToState(event, state);
      } else if (event is CartProductRemoved) {
        yield* _mapCartProductRemovedEventToState(event, state);
      }
    } catch (_) {}
  }

  Stream<CartState> _mapCartStartedEventToState() async* {
    yield CartLoading();
    try {
      await Future<void>.delayed(Duration(seconds: 1));
      yield CartLoaded();
    } catch (_) {}
  }

  Stream<CartState> _mapCartProductAddedEventToState(
      CartProductAdded event, CartState state) async* {
    if (state is CartLoaded) {
      yield CartLoaded(
        cart: Cart(
          products: List.from(state.cart.products)..add(event.product),
        ),
      );
    }
  }

  Stream<CartState> _mapCartProductRemovedEventToState(
      CartProductRemoved event, CartState state) async* {
    if (state is CartLoaded) {
      yield CartLoaded(
        cart: Cart(
          products: List.from(state.cart.products)..remove(event.product),
        ),
      );
    }
  }
}
