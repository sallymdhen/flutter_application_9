import 'package:flutter/material.dart';
import 'package:flutter_application_9/features/presentation/views/favorite_screen.dart';
import 'core/util/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Application',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.whiteColor,
        useMaterial3: true,
      ),
      home: const FavoriteScreen(),
    );
  }
}
