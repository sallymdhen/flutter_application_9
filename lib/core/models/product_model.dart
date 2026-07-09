import 'package:flutter/material.dart';

class ProductModel {
  final int? id;
  final String title;
  final String price;
  final List<Color> colors;
  final String imagePath; 
  final bool isBestSeller;

  ProductModel({
    this.id,
    required this.title,
    required this.price,
    required this.colors,
    required this.imagePath,
    this.isBestSeller = true,
  });


  factory ProductModel.fromApiJson(Map<String, dynamic> json) {
    final double rate = (json['rating']?['rate'] ?? 0).toDouble();

    return ProductModel(
      id: json['id'],
      title: json['title'] ?? '',
      price: (json['price'] ?? 0).toString(),
      imagePath: json['image'] ?? '', 
      isBestSeller: rate >= 4.0,
      colors: const [Colors.black, Colors.blue, Colors.red], 
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json['title'] ?? '',
      price: json['price'] ?? '',
      imagePath: json['imagePath'] ?? '',
      isBestSeller: json['isBestSeller'] ?? true,
      colors: (json['colors'] as List<dynamic>?)
              ?.map((colorHex) => Color(int.parse(colorHex)))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'imagePath': imagePath,
      'isBestSeller': isBestSeller,
      'colors': colors
          .map((color) => '0x${color.value.toRadixString(16).toUpperCase()}')
          .toList(),
    };
  }
}