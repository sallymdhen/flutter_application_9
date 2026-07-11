import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/util/app_colors.dart';
import 'package:flutter_application_9/core/util/app_text_style.dart';

class DescriptionWidget extends StatefulWidget {
  final String description;

  const DescriptionWidget({super.key, required this.description});

  @override
  State<DescriptionWidget> createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends State<DescriptionWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final bool isLong = widget.description.length > 120;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

       
        Text(
          isExpanded
              ? widget.description
              : isLong
                  ? widget.description.substring(0, 120) + "..."
                  : widget.description,
          style:AppTextStyle.recPassStyle,
        ),

        SizedBox(height: 10),

        
        if (isLong)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(
                  isExpanded ? "Read Less" : "Read More",
                  style: TextStyle(
                    color: AppColors.greenColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
