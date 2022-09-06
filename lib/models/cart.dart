import 'package:equatable/equatable.dart';
import 'package:shop_app/models/product.dart';

class Cart extends Equatable {
  final List<Product> products;

  const Cart({this.products = const <Product>[]});

  double deliveryFee(subTotal) {
    if (subTotal >= 30) {
      return 0.0;
    } else {
      return 10.0;
    }
  }

  double total(subTotal, deliveryFee) {
    return subTotal + deliveryFee(subTotal);
  }

  String freeDelivery(subTotal) {
    if (subTotal >= 30) {
      return 'You have FREE delivery.';
    } else {
      double missing = 30.0 - subTotal;
      return 'Add \$${missing.toStringAsFixed(2)} for free delivery.';
    }
  }

  Map productQuantity(products) {
    var quantity = Map();

    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });

    return quantity;
  }

  double get subTotal =>
      products.fold(0, (total, current) => total + current.price);

  String get subTotalString => subTotal.toStringAsFixed(2);

  String get freeDeliveryString => freeDelivery(subTotal);

  String get totalString => total(subTotal, deliveryFee).toStringAsFixed(2);

  String get deliveryFeeString => deliveryFee(subTotal).toStringAsFixed(2);

  @override
  List<Object?> get props => [products];
}
