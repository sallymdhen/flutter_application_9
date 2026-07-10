import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/util/app_colors.dart';
import '../../../core/util/app_text_style.dart';

class SearchAppBar extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final VoidCallback onCancel;
  final TextEditingController controller;

  const SearchAppBar({
    super.key,
    required this.onChanged,
    required this.onCancel,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundLight,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 10.h,
        left: 20.w,
        right: 20.w,
        bottom: 12.h,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.chevron_left,
              color: AppColors.blackColor,
              size: 24,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              'Search',
              textAlign: TextAlign.center,
              style: AppTextStyle.searchAppBarTitle,
            ),
          ),
          SizedBox(width: 12.w),
          GestureDetector(
            onTap: onCancel,
            child: Text(
              'Cancel',
              style: AppTextStyle.searchCancelText,
            ),
          ),
        ],
      ),
    );
  }
}
