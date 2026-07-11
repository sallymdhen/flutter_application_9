import 'package:flutter/material.dart';
import 'package:flutter_application_9/features/home/presention/views/favorite_screen.dart';
import 'package:flutter_application_9/features/home/presention/widgets/favorite_product_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_9/features/home/presention/views/favorite_screen.dart';


class FavoriteGridView extends StatelessWidget {
  final VoidCallback onItemRemoved;

  const FavoriteGridView({
    super.key,
    required this.onItemRemoved,
  });

  @override
  Widget build(BuildContext context) {
    final favoriteProducts = FavoriteManager.favoriteProducts;

    if (favoriteProducts.isEmpty) {
      return const Center(
        child: Text(
          'No favorite products yet!',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return GridView.builder(
      itemCount: favoriteProducts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 21.w,
        mainAxisSpacing: 20.h,
        childAspectRatio: 159 / 217,
      ),
      itemBuilder: (context, index) {
        return FavoriteProductCard(
          product: favoriteProducts[index],
          onRemoveTap: onItemRemoved, 
        );
      },
    );
  }
}