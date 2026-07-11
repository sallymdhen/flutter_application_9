import 'package:flutter/material.dart';
import '../../../../core/util/app_colors.dart';
import '../../../../core/util/app_images.dart';
import '../../../../core/util/app_text_style.dart';
import '../../../../core/util/responsive_util.dart';

class MenuHeader extends StatelessWidget {
  const MenuHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: scale(context, 96),
          height: scale(context, 96),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(AppImages.user),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: scale(context, 15)),
        Text(
          'Programmer X',
          style: AppTextStyle.menuUserName(context),
        ),
      ],
    );
  }
}