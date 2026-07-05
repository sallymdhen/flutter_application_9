import 'package:flutter/material.dart';
import '../../../../core/util/app_colors.dart';
import '../../widgets/favorite_app_bar.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: FavoriteAppBar(),
    );
  }
}
