import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/util/responsive_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

class AppTextStyles {
  static const TextStyle greenLabel = TextStyle(
    fontFamily: AppFonts.poppins,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: AppColors.primaryGreen,
  );

static TextStyle menuUserName(BuildContext context) => TextStyle(
      fontFamily: AppFonts.raleway,
      fontWeight: FontWeight.w500,
      fontSize: scale(context, 20),
      color: AppColors.whiteColor, 
    );
static TextStyle menuItemText(BuildContext context) => TextStyle(
      fontFamily: AppFonts.raleway,
      fontWeight: FontWeight.w500,
      fontSize: scale(context, 16), 
      color: AppColors.whiteColor,
    );
  
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
  }