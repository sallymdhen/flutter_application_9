import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/app/services/app_token_service.dart';
import 'package:flutter_application_9/core/service/api_service.dart' as ApiService;
import 'package:flutter_application_9/core/util/app_colors.dart';
import 'package:flutter_application_9/core/util/app_text_style.dart';
import 'package:flutter_application_9/features/profile/presention/views/model/profile_model.dart';
import 'package:flutter_application_9/features/widgets/custom_field.dart';
import 'package:flutter_application_9/features/widgets/main_button.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ProfileModel? profile;

  @override
  void initState() {
    super.initState();
    loadProfile();   
  }

  
  void loadProfile() async {
    final token = await TokenService.getToken();
    print("TOKEN IS: $token");



    profile = await ApiService.getProfile(1, token!);

    if (profile != null) {
      nameController.text =
          "${profile!.firstname} ${profile!.lastname}";
      emailController.text = profile!.email;
      passwordController.text = profile!.password;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: AppTextStyle.titleProfileStyle),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

             
              Center(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        'assets/image/my_photo.jpg',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.greenColor,
                          shape: BoxShape.circle,
                        ),
                        height: 19,
                        width: 19,
                        child: Icon(Icons.edit,
                            color: AppColors.whiteColor, size: 7),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40),

              Text('Your Name', style: AppTextStyle.labelProfileStyle),
              SizedBox(height: 12),
              CustomField(hint: '', controller: nameController),
              SizedBox(height: 12),

              Text('Email Address', style: AppTextStyle.labelProfileStyle),
              SizedBox(height: 12),
              CustomField(hint: '', controller: emailController),
              SizedBox(height: 30),

              Text('Password', style: AppTextStyle.labelProfileStyle),
              SizedBox(height: 12),
              CustomField(hint: '', controller: passwordController),
              SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Recovery password',
                      style: AppTextStyle.recPassStyle),
                ],
              ),

              SizedBox(height: 30),

              // زر حفظ التعديلات
              MainButton(
                onPressed: () async {
                  final token = await TokenService.getToken();

                  final updatedModel = ProfileModel(
                    firstname: nameController.text.split(" ")[0],
                    lastname: nameController.text.split(" ")[1],
                    email: emailController.text,
                    password: passwordController.text,
                  );

                  final success = await ApiService.updateProfile(
                      1, token!, updatedModel);

                  if (success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Profile updated successfully")),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Update failed")),
                    );
                  }
                },
                child: Text('Save Now', style: AppTextStyle.logRegStyle),
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
