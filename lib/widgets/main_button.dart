import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/util/app_colors.dart';
import 'package:flutter_application_9/core/util/app_colors.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key,required this.onPressed, required this.child, required this.width});
  final Function() onPressed;
  final Widget child;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width,height: 50,
      child: ElevatedButton(onPressed: onPressed, child: child,
       style:ElevatedButton.styleFrom(
                               backgroundColor: AppColors.greenColor,
                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                               
                               ),),
    );
  }
}