import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/util/app_colors.dart';
import '../../../core/util/app_text_style.dart';

class SearchBody extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final List<String> suggestions;

  const SearchBody({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.suggestions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundLight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Container(
              height: 52.h,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(16.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/search.svg',
                    height: 20.h,
                    width: 20.w,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: TextField(
                      controller: controller,
                      onChanged: onChanged,
                      style: AppTextStyle.searchSuggestionText,
                      decoration: InputDecoration(
                        hintText: 'Search Your Shirt',
                        hintStyle: AppTextStyle.searchHintText,
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Container(
                    height: 24.h,
                    width: 1.w,
                    color: AppColors.greyColor,
                  ),
                  SizedBox(width: 12.w),
                  SvgPicture.asset(
                    'assets/images/iconmic.svg',
                    height: 20.h,
                    width: 20.w,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 20.w, right: 20.w, top: 16.h, bottom: 8.h),
            child: Text(
              'Shirt',
              style: AppTextStyle.searchSectionTitle,
            ),
          ),
          Expanded(
            child: suggestions.isEmpty
                ? const Center(child: Text('No results found'))
                : ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    itemCount: suggestions.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: SvgPicture.asset(
                          'assets/images/Time.svg',
                          height: 22.h,
                          width: 22.w,
                        ),
                        title: Text(
                          suggestions[index],
                          style: AppTextStyle.searchSuggestionText,
                        ),
                        onTap: () {
                          controller.text = suggestions[index];
                          onChanged(suggestions[index]);
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
