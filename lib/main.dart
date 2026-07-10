import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/app/app_routes.dart';
import 'package:flutter_application_9/core/app/services/app_start_up_service.dart';
import 'core/app/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  
  final initialRoute = AppRoutes.signIn;
  // await AppStartupService.getInitialRoute();

  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
       designSize: const Size(375, 812), 
      minTextAdapt: true,
      builder: (_, child){
      return MaterialApp(
        initialRoute: initialRoute,
        onGenerateRoute: AppRouter.onGenerateRoute,
      );}
    );
  }
}

/*class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(
        child: Text('Hello Flutter'),
      ),
    );
  }
}*/
