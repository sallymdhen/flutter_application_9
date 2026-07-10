import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/util/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/notification_app_bar.dart';
import '../../widgets/notification_body.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGreyColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const NotificationAppBar(),
      ),
      body: const NotificationBody(),
    );
  }
}
