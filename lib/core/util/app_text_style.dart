import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

class AppTextStyle {
  static TextStyle appBarTitle = TextStyle(
    fontFamily: AppFonts.poppins,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor,
  );
  static final TextStyle cardBestSeller = TextStyle(
    color: AppColors.greenColor,
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle cardTitle = TextStyle(
    color: AppColors.blackColor,
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle cardPrice = TextStyle(
    color: AppColors.blackColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle notificationTitle = TextStyle(
    fontFamily: AppFonts.poppins,
    color: AppColors.blackColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle bodyText = TextStyle(
    fontFamily: AppFonts.poppins,
    color: AppColors.greyColor,
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle oldPrice = TextStyle(
    fontFamily: AppFonts.poppins,
    color: AppColors.greyColor,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle searchAppBarTitle = TextStyle(
    fontFamily: AppFonts.poppins,
    color: AppColors.blackColor,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle searchSuggestionText = TextStyle(
    fontFamily: AppFonts.poppins,
    color: AppColors.blackColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle searchCancelText = TextStyle(
    fontFamily: AppFonts.poppins,
    color: AppColors.greenColor2,
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle searchHintText = TextStyle(
    fontFamily: AppFonts.poppins,
    color: AppColors.greyColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle searchSectionTitle = TextStyle(
    fontFamily: AppFonts.poppins,
    color: AppColors.blackColor,
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
  );
}
