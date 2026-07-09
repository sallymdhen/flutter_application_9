import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_9/core/models/product_model.dart';

class ApiService {
 
  static const String _baseUrl = 'https://fakestoreapi.com/products';

  static Future<List<ProductModel>> getAllProducts() async {
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
}