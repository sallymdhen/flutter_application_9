import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/util/app_colors.dart';
import 'package:flutter_application_9/core/util/app_fonts.dart';
import 'package:flutter_application_9/core/util/responsive_util.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAllTap;

  const SectionHeader({
    super.key,
    required this.title,
    required this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: AppFonts.raleway,
            fontWeight: FontWeight.w600,
            fontSize: scale(context, 16),
            letterSpacing: 0,
            color: AppColors.blackColor,
          ),
        ),
        GestureDetector(
          onTap: onSeeAllTap,
          child: Text(
            'See all',
            style: TextStyle(
              fontFamily: AppFonts.poppins,
              fontWeight: FontWeight.w500,
              fontSize: scale(context, 12),
              letterSpacing: 0,
              color: AppColors.primaryGreen,
            ),
          ),
        ),
      ],
    );
  }
}