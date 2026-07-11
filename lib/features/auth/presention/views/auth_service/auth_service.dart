import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_9/core/app/services/app_token_service.dart';
import 'package:flutter_application_9/features/auth/presention/views/model/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static const String loginUrl = 'https://dummyjson.com/auth/login';
  static const String localUserKey = 'local_user';
  static const String localPasswordKey = 'local_password';
  static Future<UserModel?> signIn({
   // required String username,
    required String password, 
    required String username,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(loginUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'username' :username,
          //'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final user = UserModel.fromJson(data);

        await TokenService.saveToken(user.accessToken);

        return user;
      }

      return null;
    } catch (e) {
      print('Login Error: $e');
      return null;
    }
  }

  
  // (Local Register)
  
  static Future<bool> registerLocal({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      //  أنشاءت مستخدم محلي بدون توكين (خزنتو بال shared prefrence)
      final user = UserModel(
        accessToken: '',
        email: email,
        firstName: firstName,
        lastName: lastName,
        image: '',
      );

      // تخزين بياناتوللمستخدم كجيسون 
      await prefs.setString(localUserKey, jsonEncode(user.toJson()));

      // خزنت  كلمة المرور
      await prefs.setString(localPasswordKey, password);

      return true;
    } catch (e) {
      print('Register Local Error: $e');
      return false;
    }
  }
//حددت المستخدم المحلي منشان استخدم بياناتو لبعدين
  static Future<UserModel?> getLocalUser() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(localUserKey);

    if (data == null) return null;

    return UserModel.fromJson(jsonDecode(data));
  }

 /* //  دالة منشان احفظ بيانات المستخدم بعدما سجل الدخول
  static Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('saved_user', jsonEncode(user.toJson()));
  }

  //  دالة منشان  استرجاع بيانات المستخدم وقت بفتح التطبيق
  static Future<UserModel?> getSavedUser() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('saved_user');

    if (data == null) return null;

    return UserModel.fromJson(jsonDecode(data));
  }*/
}




