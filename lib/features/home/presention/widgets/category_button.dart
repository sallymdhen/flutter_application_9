import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/util/app_colors.dart';
import 'package:flutter_application_9/core/util/app_fonts.dart';
import 'package:flutter_application_9/core/util/responsive_util.dart';

class CategoryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const CategoryButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: scale(context, 40),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(scale(context, 8)),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: AppFonts.poppins,
            fontWeight: FontWeight.w400,
            fontSize: scale(context, 12),
            letterSpacing: scale(context, 1),
            height: 1.0,
            color: AppColors.blackColor,
          ),
        ),
      ),
    );
  }
}