import 'package:flutter/material.dart';
import 'package:flutter_application_9/features/home/presention/views/favorite_screen.dart';
import '../../../features/home/presention/views/cart_screen.dart';
import '../../../features/home/presention/views/home_screen.dart';
import '../../../features/home/presention/views/side_menu_view.dart';

class AppRouter {
  static const String onboard1 = '/onboard1';
  static const String onboard2 = '/onboard2';
  static const String onboard3 = '/onboard3';
  static const String signIn = '/signIn';
  static const String registerAccount = '/registerAccount';
  static const String home = '/home';
  static const String details = '/details';
  static const String favourite = '/favourite';
  static const String myCart = '/myCart';
  static const String notifications = '/notifications';
  static const String sideMenu = '/sideMenu';
  static const String profile = '/profile';
  static const String search = '/search';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      /*
      case onboard1:
        return MaterialPageRoute(builder: (_) => const OnboardOneScreen());
      case onboard2:
        return MaterialPageRoute(builder: (_) => const OnboardTwoScreen());
      case onboard3:
        return MaterialPageRoute(builder: (_) => const OnboardThreeScreen());
      case signIn:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case registerAccount:
        return MaterialPageRoute(builder: (_) => const RegisterAccountScreen());
      */

      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case myCart:
        return MaterialPageRoute(builder: (_) => const CartScreen());

      case sideMenu:
        return MaterialPageRoute(builder: (_) => const SideMenuView());
 case favourite:
        return MaterialPageRoute(builder: (_) => const FavoriteScreen());
      /*
      case details:
        return MaterialPageRoute(builder: (_) => const DetailsScreen());
      case favourite:
        return MaterialPageRoute(builder: (_) => const FavouriteScreen());
      case notifications:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case search:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      */

      default:
        return _unDefinedRoute();
    }
  }

  static Route<dynamic> _unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('Route not found!'),
        ),
      ),
    );
  }
}