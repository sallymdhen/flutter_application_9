import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/util/app_colors.dart';
import 'package:flutter_application_9/core/util/app_fonts.dart';
import 'package:flutter_application_9/core/util/responsive_util.dart';

class CartAppBar extends StatelessWidget {
  final int itemCount;
  final VoidCallback onBackTap;

  const CartAppBar({
    super.key,
    required this.itemCount,
    required this.onBackTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: scale(context, 44),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Text(
                  'My Cart',
                  style: TextStyle(
                    fontFamily: AppFonts.raleway,
                    fontWeight: FontWeight.w600,
                    fontSize: scale(context, 16),
                    height: 20 / 16,
                    letterSpacing: 0,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                child: GestureDetector(
                  onTap: onBackTap,
                  child: Container(
                    width: scale(context, 44),
                    height: scale(context, 44),
                    padding: EdgeInsets.all(scale(context, 15)),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(scale(context, 40)),
                    ),
                    child: Icon(
                      Icons.chevron_left,
                      size: scale(context, 14),
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: scale(context, 12)),
        Text(
          '$itemCount Item',
          style: TextStyle(
            fontFamily: AppFonts.poppins,
            fontWeight: FontWeight.w500,
            fontSize: scale(context, 16),
            height: 1.0,
            letterSpacing: 0,
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
  }
}