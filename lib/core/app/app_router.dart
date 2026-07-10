import 'package:flutter/material.dart';
import 'package:flutter_application_9/features/auth/presention/views/register_view.dart';
import 'package:flutter_application_9/features/auth/presention/views/sing_in_view.dart';
import 'package:flutter_application_9/core/app/app_routes.dart';
import 'package:flutter_application_9/features/details/presention/views/details.dart';
import 'package:flutter_application_9/features/presentation/views/favorite_screen.dart' show FavoriteManager, FavoriteScreen;
import 'package:flutter_application_9/features/presentation/views/notification_screen.dart';
import 'package:flutter_application_9/features/profile/presention/views/profile.dart';

class AppRouter {

  
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      
     // case AppRoutes.onboard1:
       // return MaterialPageRoute(builder: (_) => const OnboardOneScreen());
      //case AppRoutes.onboard2:
        //return MaterialPageRoute(builder: (_) => const OnboardTwoScreen());
      //case AppRoutes.onboard3:
        //return MaterialPageRoute(builder: (_) => const OnboardThreeScreen());
      case AppRoutes.signIn:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case AppRoutes.registerAccount:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      

     // case AppRoutes.home:
       // return MaterialPageRoute(builder: (_) => const HomeScreen());

      //case AppRoutes.myCart:
        //return MaterialPageRoute(builder: (_) => const CartScreen());

      //case AppRoutes.sideMenu:
        //return MaterialPageRoute(builder: (_) => const SideMenuView());

      
      //case AppRoutes.details:
        //return MaterialPageRoute(builder: (_) => const Details(product: ,));
      case AppRoutes.favourite:
        return MaterialPageRoute(builder: (_) => const FavoriteScreen());
      case AppRoutes.notifications:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case AppRoutes.profile:
        return MaterialPageRoute(builder: (_) => const Profile());
      //case AppRoutes.search:
        //return MaterialPageRoute(builder: (_) => const SearchScreen());
      

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