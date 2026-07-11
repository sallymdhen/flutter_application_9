import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/util/app_colors.dart';
import '../../../../core/util/app_text_style.dart';
import '../../../../core/util/responsive_util.dart';

class MenuItemTile extends StatelessWidget {
  final dynamic icon; 
  final String title;
  final VoidCallback onTap;
  final bool showArrow;

  const MenuItemTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.showArrow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(scale(context, 8)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: scale(context, 14),
        ),
        child: Row(
          children: [
            
            if (icon is String)
              SvgPicture.asset(
                icon,
                width: title == 'Sign Out' ? scale(context, 18) : scale(context, 24),
                height: title == 'Sign Out' ? scale(context, 18) : scale(context, 24),
                colorFilter: const ColorFilter.mode(
                  AppColors.whiteColor,
                  BlendMode.srcIn,
                ),
              )
            else if (icon is IconData)
              Icon(
                icon,
                size: scale(context, 24),
                color: AppColors.whiteColor,
              ),
              
            SizedBox(width: scale(context, 22)),
            
            Text(
              title,
              style: AppTextStyle.menuItemText(context),
            ),
            const Spacer(),
            if (showArrow)
              Icon(
                Icons.arrow_forward_ios,
                size: scale(context, 16),
                color: AppColors.whiteColor.withOpacity(0.8),
              ),
          ],
        ),
      ),
    );
  }
}