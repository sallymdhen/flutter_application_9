import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/models/product_model.dart';
import 'package:flutter_application_9/core/util/app_colors.dart';
import 'package:flutter_application_9/core/util/app_text_style.dart';
import 'package:flutter_application_9/features/home/presention/views/favorite_screen.dart'; // للوصول لـ FavoriteManager
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onRemoveTap;

  const FavoriteProductCard({
    super.key,
    required this.product,
    required this.onRemoveTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 159.w,
      height: 217.h,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyColor.withOpacity(0.15),
            blurRadius: 8.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 20.h,
              left: 14.w,
              right: 14.w,
              bottom: 14.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Center(
                  
                    child: Image.network(
                      product.imagePath,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                      
                        return const Icon(Icons.image_not_supported, size: 40);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                if (product.isBestSeller)
                  Text(
                    'BEST SELLER',
                    style: AppTextStyles.cardBestSeller,
                  )
                else
                  SizedBox(height: 18.h),
                SizedBox(height: 4.h),
                Text(
                  product.title,
                  style: AppTextStyles.cardTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${product.price}',
                      style: AppTextStyles.cardPrice,
                    ),
                    Row(
                      children: product.colors
                          .map((color) => Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: CircleAvatar(
                                  radius: 6.r,
                                  backgroundColor: color,
                                ),
                              ))
                          .toList(),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 12.h,
            left: 12.w,
            child: GestureDetector(
              onTap: () {
              
                FavoriteManager.favoriteProducts.remove(product);
               
                onRemoveTap();
              },
              child: Container(
                height: 28.h,
                width: 28.w,
                decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x1A000000),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.favorite_rounded,
                  color: AppColors.notificationRed,
                  size: 16.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}