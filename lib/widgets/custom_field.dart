import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/util/app_colors.dart';
import 'package:flutter_application_9/core/util/app_text_style.dart';

class CustomField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final bool isPassword;
  final String? Function(String?)? validator;


  const CustomField({
    super.key,
    required this.hint,
    required this.controller,
    this.isPassword = false,  this.validator,
    
  });

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      obscureText: widget.isPassword ? !isVisible : false,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: AppTextStyle.hintProfileStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.greenColor),
        ),

      
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  isVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
              )
            : null,
      ),
    );
  }
}
