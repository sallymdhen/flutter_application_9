import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/util/app_colors.dart';
import '../../../core/util/app_text_style.dart';

class NotificationAppBar extends StatelessWidget {
  const NotificationAppBar({super.key});

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
            onTap: () {Navigator.pop(context);},
            borderRadius: BorderRadius.circular(40.r),
            child: Container(
              height: 44.h,
              width: 44.w,
              decoration: BoxDecoration(
                color: AppColors.lightGreyColor,
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
            'Notifications',
            style: AppTextStyle.appBarTitle,
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
              child: Center(
                child: SvgPicture.asset(
                  'assets/images_svg/icon_delet.svg',
                 
                  width: 20.w,
                  height: 20.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
