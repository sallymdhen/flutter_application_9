import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/util/app_colors.dart';

class ProductModel {
  final String title;
  final String price;
  final List<Color> colors;
  final String imagePath;
  final bool isBestSeller;

  ProductModel({
    required this.title,
    required this.price,
    required this.colors,
    required this.imagePath,
    this.isBestSeller = true,
  });

  static List<ProductModel> getMockProducts() {
    return [
      ProductModel(
        imagePath: "assets/images/tshirt1.png",
        title: 'Programmer T-shirt',
        price: '\$58.7',
        colors: [AppColors.productRed, AppColors.blue],
      ),
      ProductModel(
        imagePath: "assets/images/tshirt2.png",
        title: 'Programmer T-shirt',
        price: '\$37.8',
        colors: [AppColors.blue, AppColors.productRed],
      ),
      ProductModel(
        imagePath: "assets/images/tshirt4.png",
        title: 'Programmer T-shirt',
        price: '\$47.7',
        colors: [AppColors.productBlue, AppColors.productLightBlue],
      ),
      ProductModel(
        imagePath: "assets/images/tshirt3.png",
        title: 'Programmer T-shirt',
        price: '\$57.6',
        colors: [AppColors.productTeal, AppColors.productPurple],
      ),
    ];
  }
}
