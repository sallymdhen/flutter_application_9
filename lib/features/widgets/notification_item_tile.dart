import 'package:flutter/material.dart';
import 'package:flutter_application_9/features/favorite/data/models/notification_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/util/app_colors.dart';
import '../../../core/util/app_text_style.dart';

class NotificationItemTile extends StatelessWidget {
  final NotificationModel notification;

  const NotificationItemTile({
    super.key,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    final double imageSize = notification.isCard ? 72.w : 85.w;

    Widget content = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: imageSize,
                height: imageSize,
                decoration: BoxDecoration(
                  color: notification.isCard
                      ? AppColors.lightGreyColor
                      : AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                padding: EdgeInsets.all(8.w),
                child: Image.asset(
                  notification.imagePath,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification.title,
                      style: AppTextStyle.notificationTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (notification.subtitle.isNotEmpty) ...[
                      SizedBox(height: 4.h),
                      Text(
                        notification.subtitle,
                        style: AppTextStyle.bodyText,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    if (notification.originalPrice != null) ...[
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Text(
                            notification.discountedPrice!,
                            style: AppTextStyle.cardPrice,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            notification.originalPrice!,
                            style: AppTextStyle.oldPrice,
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 8.w),
        Padding(
          padding: EdgeInsets.only(top: 4.h),
          child: Text(
            notification.time,
            style: AppTextStyle.bodyText,
          ),
        ),
      ],
    );

    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: notification.isCard
            ? [
                BoxShadow(
                  color: const Color(0xFF000000).withOpacity(0.04),
                  blurRadius: 12.r,
                  offset: Offset(0, 4.h),
                ),
              ]
            : null,
      ),
      child: content,
    );
  }
}
