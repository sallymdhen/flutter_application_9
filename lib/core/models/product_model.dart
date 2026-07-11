import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/util/app_colors.dart';

class ProductModel {
  final int? id;
  final String title;
  final String price;
  final List<Color> colors;
  final String imagePath;
  final bool isBestSeller;
  final String description;

  ProductModel({
    this.id,
    required this.title,
    required this.price,
    required this.colors,
    required this.imagePath,
    this.isBestSeller = true,
    required this.description,
  });

  factory ProductModel.fromApiJson(Map<String, dynamic> json) {
    final double rate = (json['rating']?['rate'] ?? 0).toDouble();

    return ProductModel(
      id: json['id'],
      title: json['title'] ?? '',
      price: (json['price'] ?? 0).toString(),
      imagePath: json['image'] ?? '',
      isBestSeller: rate >= 4.0,
      colors: const [
        AppColors.blackColor,
        AppColors.productTeal,
        AppColors.redColor,
      ],
      description: json['description'] ?? '',

     
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(

      id: json['id'],
      title: json['title'] ?? '',
      price: json['price'] ?? '',
      imagePath: json['imagePath'] ?? '',
      isBestSeller: json['isBestSeller'] ?? true,
      colors: (json['colors'] as List<dynamic>?)
              ?.map((colorHex) => Color(int.parse(colorHex)))
              .toList() ??
          [],
      description: json['description'] ?? '',

    );
  }

  Map<String, dynamic> toJson() {
    return {

      'id': id,
      'title': title,
      'price': price,
      'imagePath': imagePath,
      'isBestSeller': isBestSeller,
      'colors': colors
          .map((color) => '0x${color.value.toRadixString(16).toUpperCase()}')
          .toList(),
      'description': description,
    };
  }
}
