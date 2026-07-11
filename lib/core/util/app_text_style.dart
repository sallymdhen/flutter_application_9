import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/util/responsive_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';
import 'app_fonts.dart';



class AppTextStyle {
  static TextStyle hintTRegisterField =
      TextStyle(
        fontSize: 16,
        fontFamily: AppFonts.raleway,
        color: AppColors.blackColor,
        fontWeight: FontWeight.w500,
      );

  static TextStyle logRegStyle =
      TextStyle(
        fontSize: 14,
        fontFamily: AppFonts.raleway,
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w600,
      );

  static TextStyle secondryButtonStyle =
      TextStyle(
        fontSize: 14,
        fontFamily: AppFonts.raleway,
        color: AppColors.blackColor,
        fontWeight: FontWeight.w600,
      );

  static TextStyle titleProfileStyle =
      TextStyle(
        fontSize: 20,
        fontFamily: AppFonts.raleway,
        color: AppColors.blackColor,
        fontWeight: FontWeight.w600,
      );

  static TextStyle labelProfileStyle =
      TextStyle(
        fontSize: 16,
        fontFamily: AppFonts.raleway,
        color: AppColors.greyColor,
        fontWeight: FontWeight.w600,
      );

  static TextStyle paraInDetlsStyle =
      TextStyle(
        fontSize: 14,
        fontFamily: AppFonts.poppins,
        color: AppColors.greyColor,
        fontWeight: FontWeight.w400,
      );

  static TextStyle recPassStyle =
      TextStyle(
        fontSize: 12,
        fontFamily: AppFonts.poppins,
        color: AppColors.greyColor,
        fontWeight: FontWeight.w400,
      );

  static TextStyle hintProfileStyle =
      TextStyle(
        fontSize: 14,
        fontFamily: AppFonts.poppins,
        color: AppColors.blackColor,
        fontWeight: FontWeight.w500,
      );

  static TextStyle appBarScreensStyle =
      TextStyle(
        fontSize: 16,
        fontFamily: AppFonts.raleway,
        color: AppColors.blackColor,
        fontWeight: FontWeight.w600,
      );

  static TextStyle programerDetailStyle =
      TextStyle(
        fontSize: 26,
        fontFamily: AppFonts.raleway,
        color: AppColors.blackColor,
        fontWeight: FontWeight.w700,
      );

  static TextStyle titleApiDetailStyle =
      TextStyle(
        fontSize: 26,
        fontFamily: AppFonts.raleway,
        color: AppColors.greyColor,
        fontWeight: FontWeight.w600,
      );

  static TextStyle priceApiDetailStyle =
      TextStyle(
        fontSize: 24,
        fontFamily: AppFonts.poppins,
        color: AppColors.blackColor,
        fontWeight: FontWeight.w600,
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
  }

