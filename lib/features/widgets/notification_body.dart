import 'package:flutter/material.dart';
import 'package:flutter_application_9/features/favorite/data/models/notification_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/util/app_text_style.dart';
import 'notification_item_tile.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      children: [
        Text(
          'Recent',
          style: AppTextStyle.appBarTitle,
        ),
        SizedBox(height: 8.h),
        ...NotificationModel.getRecentNotifications()
            .map((notification) => NotificationItemTile(
                  notification: notification,
                )),
        SizedBox(height: 16.h),
        Text(
          'Yesterday',
          style: AppTextStyle.appBarTitle,
        ),
        SizedBox(height: 8.h),
        ...NotificationModel.getYesterdayNotifications()
            .map((notification) => NotificationItemTile(
                  notification: notification,
                )),
      ],
    );
  }
}
