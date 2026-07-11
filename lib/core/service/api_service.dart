import 'package:flutter/material.dart';
 import 'package:flutter_application_9/features/profile/presention/views/model/profile_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_9/core/models/product_model.dart';


Future<ProfileModel?> getProfile(int id) async {
  try {
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/users/$id'),
      
    );

    if (response.statusCode == 200) {
      return ProfileModel.fromJson(jsonDecode(response.body));
    }

    return null;
  } catch (e) {
    print('GET Profile Error: $e');
    return null;
  }
}
 Future<bool> updateProfile(int id, String token, ProfileModel model) async {
  try {
    final response = await http.put(
      Uri.parse('https://fakestoreapi.com/users/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(model.toJson()),
    );

    return response.statusCode == 200;
  } catch (e) {
    print('PUT Profile Error: $e');
    return false;
  }
}
 const String _baseUrl = 'https://fakestoreapi.com/products';

 Future<List<ProductModel>> getAllProducts() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        
        List<dynamic> data = jsonDecode(response.body);
        return data.map((item) => ProductModel.fromApiJson(item)).toList();
      } else {
        throw Exception('فشل تحميل المنتجات، رمز الحالة: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('حدث خطأ أثناء الاتصال بالـ API: $e');
    }
  }




