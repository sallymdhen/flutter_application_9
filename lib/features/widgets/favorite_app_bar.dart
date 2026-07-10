import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/util/app_colors.dart';
import 'package:flutter_application_9/core/util/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FavoriteAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 10.h,
        left: 21.w,
        right: 19.w,
        bottom: 10.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(40.r),
            child: Container(
              height: 44.h,
              width: 44.w,
              decoration: const BoxDecoration(
                color: Color(0xFFF7F7F9),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.chevron_left,
                color: AppColors.blackColor,
                size: 24.sp,
              ),
            ),
          ),
          Text(
            'Favourite',
            style: AppTextStyle.appBarTitle.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            height: 44.h,
            width: 44.w,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyColor.withOpacity(0.15),
                  blurRadius: 8.r,
                  offset: Offset(0, 4.h),
                ),
              ],
            ),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(40.r),
              child: Icon(
                Icons.favorite_border,
                color: AppColors.blackColor,
                size: 20.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.h);
}
