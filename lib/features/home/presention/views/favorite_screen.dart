import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/util/app_colors.dart';
import 'package:flutter_application_9/features/home/presention/widgets/app_bar_favorite.dart';
import 'package:flutter_application_9/features/home/presention/widgets/favorite_gride_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_9/core/models/product_model.dart';

class FavoriteManager {
  static List<ProductModel> favoriteProducts = [];
}

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const FavoriteAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: FavoriteGridView(
          
          onItemRemoved: () {
            setState(() {});
          },
        ),
      ),
    );
  }
}