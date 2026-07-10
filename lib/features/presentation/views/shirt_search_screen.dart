import 'package:flutter/material.dart';
import 'package:flutter_application_9/features/widgets/search_app_bar.dart';
import 'package:flutter_application_9/features/widgets/search_body.dart';
import '../../../core/util/app_colors.dart';

class ShirtSearchScreen extends StatefulWidget {
  const ShirtSearchScreen({super.key});

  @override
  State<ShirtSearchScreen> createState() => _ShirtSearchScreenState();
}

class _ShirtSearchScreenState extends State<ShirtSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _shirtSuggestions = [
    'New T-Shirt',
    'Top T-shirt',
    'Programmer',
    'Shirt',
    'Black Shirt',
    'White Shirt',
  ];
  List<String> _filteredSuggestions = [];

  @override
  void initState() {
    super.initState();
    _filteredSuggestions = _shirtSuggestions;
  }

  void _filterSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredSuggestions = _shirtSuggestions;
      } else {
        _filteredSuggestions = _shirtSuggestions
            .where(
                (shirt) => shirt.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Column(
        children: [
          SearchAppBar(
            controller: _searchController,
            onChanged: _filterSearch,
            onCancel: () {
              _searchController.clear();
              _filterSearch('');
              FocusScope.of(context).unfocus();
            },
          ),
          Expanded(
            child: SearchBody(
              controller: _searchController,
              onChanged: _filterSearch,
              suggestions: _filteredSuggestions,
            ),
          ),
        ],
      ),
    );
  }
}
