 import 'package:flutter_application_9/features/profile/presention/views/model/profile_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


Future<ProfileModel?> getProfile(int id, String token) async {
  try {
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/users/$id'),
      headers: {
        'Authorization': 'Bearer $token',
      },
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

