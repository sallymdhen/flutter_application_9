//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:http/http.dart' as http;


import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/app/app_routes.dart';

import 'package:flutter_application_9/core/util/app_colors.dart';
import 'package:flutter_application_9/core/util/app_text_style.dart';
import 'package:flutter_application_9/features/auth/presention/views/auth_service/auth_service.dart';
import 'package:flutter_application_9/features/auth/presention/views/widget/icon_back.dart';
import 'package:flutter_application_9/features/auth/presention/views/widget/secondary_button.dart';
import 'package:flutter_application_9/features/auth/presention/views/widget/text_title.dart';
import 'package:flutter_application_9/widgets/custom_field.dart';
import 'package:flutter_application_9/widgets/main_button.dart';
import 'package:flutter_application_9/widgets/text_boarding.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();

}

class _RegisterViewState extends State<RegisterView> {
   final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
String? validateName(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "Name is required";
  }
  if (value.length < 3) {
    return "Name must be at least 3 characters";
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.length < 8) {
    return "Password must be at least 8 characters";
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return "Password is required";
  }

  if (!value.contains('@')) {
    return "Password must contain @";
  }

  return null;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(padding: EdgeInsets.all(20),
      child: Form(
          key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              IconBack(),
              SizedBox(height: 11),
              TextTitle(title: 'Register Account'),
              SizedBox(height: 30,),
              Text('Name',style: AppTextStyle.hintTRegisterField,),
              SizedBox(height: 12,),
              CustomField(hint:'xxxxx', controller: nameController, validator: validateName),
              SizedBox(height: 12,),
              Text('Email Addrees',style: AppTextStyle.hintTRegisterField,),
              SizedBox(height: 12,),
               CustomField(hint:'sally@gmail.com', controller: emailController,validator: validateEmail,),
               SizedBox(height: 12,),
              Text('password',style: AppTextStyle.hintTRegisterField,),
              SizedBox(height: 12,),
               CustomField(hint:'985674283', controller: passwordController,validator: validatePassword,isPassword: true,),
               SizedBox(height: 40,),
              MainButton(onPressed: () async {
                                     if (formKey.currentState!.validate()) {
                                     final success = await AuthService.registerLocal(
                                      email: emailController.text.trim(),
                                      firstName: nameController.text.trim(),  
                                      lastName: 'prog',                             
                                      password: passwordController.text.trim(), );

                                    if (success) {
                                          Navigator.pushReplacementNamed(context, AppRoutes.signIn);

                                      } 
                                    else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('فشل إنشاء الحساب')),
                                                                                );
                                          }
                                                                              }
                                               }

              , child: Text('Register',style: AppTextStyle.logRegStyle,),
                         width: double.infinity),
              SizedBox(height: 24,) ,
              SecondaryButton() ,
              SizedBox(height: 55.h,),
              Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already Have Account? ",style:TextStyle(
              color: AppColors.blackColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ) ,),
              GestureDetector(
          onTap: () {
           Navigator.pushNamed(context, AppRoutes.signIn);
          },
          child: Text(
            "Log In",
            style: TextStyle(
              color: AppColors.blackColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
              ),
            ],
          )
             
          
              
          
          
          ],),
        ),
      ) ,)),
    )
    ;
  }
}