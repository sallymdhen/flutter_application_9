import 'package:flutter_application_9/core/app/services/app_token_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app_routes.dart';

class AppStartupService {
  static Future<String> getInitialRoute() async {
    final token = await TokenService.getToken();

    if (token != null && token.isNotEmpty) {
      return AppRoutes.home;
    }

    return AppRoutes.onboarding;
  }
}
