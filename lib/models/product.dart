import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  Product({
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });

  @override
  List<Object?> get props => [
        name,
        imageUrl,
        category,
        price,
        isRecommended,
        isPopular,
      ];

  static List<Product> products = [
    Product(
      name: 'Product 1',
      imageUrl:
          'https://images.unsplash.com/photo-1527960471264-932f39eb5846?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      category: 'Soft Drink',
      price: 12.99,
      isRecommended: false,
      isPopular: true,
    ),
    Product(
      name: 'Product 2',
      imageUrl:
          'https://images.unsplash.com/photo-1600718374662-0483d2b9da44?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80',
      category: 'Smoothies',
      price: 12.22,
      isRecommended: false,
      isPopular: false,
    ),
    Product(
      name: 'Product 3',
      imageUrl:
          'https://images.unsplash.com/photo-1439508472515-4899b144f04d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1632&q=80',
      category: 'Water',
      price: 12.22,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      name: 'Product 4',
      imageUrl:
          'https://images.unsplash.com/photo-1505252585461-04db1eb84625?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=708&q=80',
      category: 'Smoothies',
      price: 12.22,
      isRecommended: false,
      isPopular: true,
    ),
  ];
}
