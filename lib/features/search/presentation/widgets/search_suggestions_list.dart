import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bookia_store_app/features/search/data/models/search_model.dart';
import 'package:bookia_store_app/features/search/presentation/widgets/search_suggestion_item.dart';

class SearchSuggestionsList extends StatelessWidget {
  final List<SearchResultModel> suggestions;
  final String query;

  const SearchSuggestionsList({
    super.key,
    required this.suggestions,
    required this.query,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Found ${suggestions.length} result${suggestions.length != 1 ? 's' : ''}',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: suggestions.length,
            itemBuilder: (context, index) {
              final suggestion = suggestions[index];
              return SearchSuggestionItem(
                book: suggestion,
                query: query,
                index: index,
              );
            },
          ),
        ],
      ),
    );
  }
}
