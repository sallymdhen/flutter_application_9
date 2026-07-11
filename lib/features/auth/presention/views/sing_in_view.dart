import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/app/app_routes.dart';
import 'package:flutter_application_9/core/app/services/app_token_service.dart';
import 'package:flutter_application_9/core/util/app_text_style.dart';
import 'package:flutter_application_9/features/auth/presention/views/auth_service/auth_service.dart';
import 'package:flutter_application_9/features/auth/presention/views/widget/icon_back.dart';
import 'package:flutter_application_9/features/auth/presention/views/widget/secondary_button.dart';
import 'package:flutter_application_9/features/auth/presention/views/widget/text_title.dart';
import 'package:flutter_application_9/features/widgets/custom_field.dart';
import 'package:flutter_application_9/features/widgets/main_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //bool _passwordVisible = false;

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    //if (!value.contains('@')) {
      //return "Enter a valid email";
    //}
    //return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    return null;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: IconBack(),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //SizedBox(height: 80),

              TextTitle(title: 'Hello Again!'),
              const SizedBox(height: 32),

              Form(
                key: _formKey,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email Address', style: AppTextStyle.hintTRegisterField),
                    SizedBox(height: 12),
                    CustomField(
                      hint: 'sally@gmail.com',
                      controller: emailController,
                      validator: validateEmail,
                    ),

                    SizedBox(height: 12),
                    Text('Password', style: AppTextStyle.hintTRegisterField),
                    SizedBox(height: 12),
                    CustomField(
                      hint: '********',
                      controller: passwordController,
                      validator: validatePassword,
                      isPassword: true,
                    ),
                  ],
                ),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Recovery Password',
                    style: TextStyle(color: Color(0xFF2B2B2B), fontSize: 13),
                  ),
                ),
              ),
              const SizedBox(height: 8),
             
             MainButton(
  onPressed: () async {
    if (_formKey.currentState!.validate()) {

      final user = await AuthService.signIn(
        username: emailController.text.trim(),
        password: passwordController.text.trim(), 
        //username: '',
      );

      if (user != null) {
        await TokenService.saveToken(user.accessToken);
       
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('خطأ في تسجيل الدخول')),
        );
      }
    }
  },
  child: Text('Sign In',style: AppTextStyle.logRegStyle,),
  width: double.infinity,
),


   







              const SizedBox(height: 20),
              SecondaryButton(),
              SizedBox(height: 135.h),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'New User? ',
                      style: TextStyle(color: Color(0xFF6B6B6B), fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.registerAccount);
                        
                      },
                      child: const Text(
                        'Create Account',
                        style: TextStyle(
                          color: Color(0xFF2B2B2B),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
