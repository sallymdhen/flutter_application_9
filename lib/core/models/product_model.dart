import 'package:flutter/material.dart';

class ProductModel {
  final String title;
  final String price;
  final List<Color> colors;
  final String imagePath;
  final bool isBestSeller;
  final String description;

  ProductModel({
    required this.title,
    required this.price,
    required this.colors,
    required this.imagePath,
    this.isBestSeller = true, 
    required this.description,
  });

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

      description: json['description']??''    
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
      'description': description,
    
    };
  }
}
