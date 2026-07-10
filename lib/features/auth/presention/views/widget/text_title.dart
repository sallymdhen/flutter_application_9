import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/util/app_fonts.dart';
import 'package:flutter_application_9/widgets/text_boarding.dart';

class TextTitle extends StatelessWidget {
    TextTitle({super.key,required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding
     (padding: EdgeInsets.symmetric(horizontal: 37)
      ,child: Column(
        children: [
          Text(title,style: TextStyle(fontSize: 32,
                      fontWeight: FontWeight.w700,
                      fontFamily:AppFonts.raleway ),),
          SizedBox(height: 8,),            
          TextBoarding(text: 'Fill your details or continue withsocial media'),           
        ],
      ));
  }
}