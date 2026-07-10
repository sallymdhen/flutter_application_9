import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/util/app_colors.dart';
import 'package:flutter_application_9/core/util/app_fonts.dart';

class TextBoarding extends StatelessWidget {
   TextBoarding({super.key, required this.text});
 final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,style: 
                TextStyle(fontSize: 16,fontFamily: AppFonts.poppins,
                           fontWeight:FontWeight.w400,letterSpacing: 0,
                           color: AppColors.greyColor
                            ),) ;
  }
}