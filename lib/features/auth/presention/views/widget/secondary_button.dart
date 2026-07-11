import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/util/app_images.dart';
import 'package:flutter_application_9/core/util/app_text_style.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 50,
      child: ElevatedButton(
        onPressed: (){}, child: 
      Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.googlePhoto,width:22 ,height: 22,),
          SizedBox(width: 14,),
          Text('Sing up with google',style: AppTextStyle.secondryButtonStyle,)
      
      
      
      
      
      
      
      
        ],
      )),
    );
  }
}