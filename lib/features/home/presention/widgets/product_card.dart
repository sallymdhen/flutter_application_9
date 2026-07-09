import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/models/product_model.dart';
import 'package:flutter_application_9/core/util/app_colors.dart';
import 'package:flutter_application_9/core/util/app_text_style.dart';
import 'package:flutter_application_9/features/home/presention/views/favorite_screen.dart'; 
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatefulWidget {
  final ProductModel product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    bool isFavorite = FavoriteManager.favoriteProducts.contains(widget.product);
    
    ModalRoute<dynamic>? currentRoute = ModalRoute.of(context);
    bool isInsideFavoriteScreen = currentRoute?.settings.name == '/FavoriteScreen' || 
                                  context.widget.toString().contains('Favorite');

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
                      widget.product.imagePath,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.image_not_supported, size: 40);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                if (widget.product.isBestSeller)
                  Text(
                    'BEST SELLER',
                    style: AppTextStyles.cardBestSeller,
                  )
                else
                  SizedBox(height: 18.h),
                SizedBox(height: 4.h),
                Text(
                  widget.product.title,
                  style: AppTextStyles.cardTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${widget.product.price}',
                      style: AppTextStyles.cardPrice,
                    ),
                    if (isInsideFavoriteScreen)
                      Row(
                        children: widget.product.colors
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
                setState(() {
                  if (isFavorite) {
                    FavoriteManager.favoriteProducts.remove(widget.product);
                  } else {
                    FavoriteManager.favoriteProducts.add(widget.product);
                  }
                });
              },
              child: Container(
                height: 28.h,
                width: 28.w,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  shape: BoxShape.circle,
                  boxShadow: isInsideFavoriteScreen 
                      ? null 
                      : [
                          const BoxShadow(
                            color: Color(0x1A000000),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                ),
                child: Icon(
                  isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                  color: isFavorite ? AppColors.notificationRed : AppColors.greyColor,
                  size: 16.sp,
                ),
              ),
            ),
          ),
          if (!isInsideFavoriteScreen)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 34.w,
                height: 34.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14.r),
                    bottomRight: Radius.circular(14.r),
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
        ],
      ),
    );
  }
}