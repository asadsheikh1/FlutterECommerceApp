import 'package:equatable/equatable.dart';
import 'package:shop_app/models/product.dart';

class Wishlist extends Equatable {
  final List<Product> products;

  Wishlist({this.products = const <Product>[]});

  @override
  List<Object?> get props => [products];
}
