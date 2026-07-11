import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/app/app_routes.dart';
import 'package:flutter_application_9/core/app/services/app_start_up_service.dart';
import 'core/app/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:flutter_application_9/features/presentation/views/favorite_screen.dart';
import 'core/util/app_colors.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final initialRoute = await AppStartupService.getInitialRoute();
  
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
        title: 'Flutter Application',
         debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.backgroundLight,
            useMaterial3: true,
          ),
        initialRoute: initialRoute,
        onGenerateRoute: AppRouter.onGenerateRoute,
      );}
    );
  }
}
