import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/util/app_colors.dart';
import '../../../core/util/app_text_style.dart';

class ShirtSearchDelegate extends SearchDelegate {
  final List<String> shirtSuggestions = [
    'New T-Shirt',
    'Top T-shirt',
    'Programmer',
    'Shirt',
    'Black Shirt',
    'White Shirt',
  ];

  @override
  String get searchFieldLabel => 'Search Your Shirt';

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      scaffoldBackgroundColor: AppColors.whiteColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.blackColor),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: AppTextStyle.bodyText,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear, color: AppColors.blackColor),
          onPressed: () {
            query = '';
          },
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.chevron_left, size: 28),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = shirtSuggestions
        .where((shirt) => shirt.toLowerCase().contains(query.toLowerCase()))
        .toList();

    if (results.isEmpty) {
      return const Center(child: Text('No results found'));
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            results[index],
            style: AppTextStyle.searchSuggestionText,
          ),
          onTap: () {
            close(context, results[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? shirtSuggestions
        : shirtSuggestions
            .where(
                (shirt) => shirt.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading:
              const Icon(Icons.history, color: AppColors.greyColor, size: 20),
          title: Text(
            suggestions[index],
            style: AppTextStyle.searchSuggestionText,
          ),
          onTap: () {
            query = suggestions[index];
            showResults(context);
          },
        );
      },
    );
  }
}
