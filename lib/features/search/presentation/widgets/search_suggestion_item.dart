import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bookia_store_app/features/search/data/models/search_model.dart';
import 'package:bookia_store_app/core/theme/app_color.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SearchSuggestionItem extends StatelessWidget {
  final SearchResultModel book;
  final String query;
  final int index;

  const SearchSuggestionItem({
    super.key,
    required this.book,
    required this.query,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed('/bookDetailsScreen', arguments: book.id);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey[200]!, width: 1),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBookImage(),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHighlightedTitle(),
                  SizedBox(height: 6.h),
                  if (book.category != null && book.category!.isNotEmpty)
                    Text(
                      book.category ?? '',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[600],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  SizedBox(height: 8.h),
                  _buildPriceSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        width: 60.w,
        height: 80.h,
        color: Colors.grey[200],
        child: book.image != null && book.image!.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: book.image!,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: SizedBox(
                    width: 30.w,
                    height: 30.w,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColor.primaryColor,
                      ),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Center(
                  child: Icon(
                    Icons.book_outlined,
                    color: Colors.grey[400],
                    size: 32.sp,
                  ),
                ),
              )
            : Center(
                child: Icon(
                  Icons.book_outlined,
                  color: Colors.grey[400],
                  size: 32.sp,
                ),
              ),
      ),
    );
  }

  Widget _buildHighlightedTitle() {
    final name = book.name ?? '';
    if (query.isEmpty) {
      return Text(
        name,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      );
    }

    return RichText(
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      text: _buildHighlightedSpans(name, query),
    );
  }

  TextSpan _buildHighlightedSpans(String text, String query) {
    final lowerText = text.toLowerCase();
    final lowerQuery = query.toLowerCase();
    final List<TextSpan> spans = [];

    int currentIndex = 0;
    int matchIndex = lowerText.indexOf(lowerQuery);

    while (matchIndex != -1 && currentIndex < text.length) {
      if (matchIndex > currentIndex) {
        spans.add(
          TextSpan(
            text: text.substring(currentIndex, matchIndex),
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        );
      }

      spans.add(
        TextSpan(
          text: text.substring(matchIndex, matchIndex + query.length),
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryColor,
            backgroundColor: AppColor.primaryColor.withOpacity(0.15),
          ),
        ),
      );

      currentIndex = matchIndex + query.length;
      matchIndex = lowerText.indexOf(lowerQuery, currentIndex);
    }

    if (currentIndex < text.length) {
      spans.add(
        TextSpan(
          text: text.substring(currentIndex),
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      );
    }

    return TextSpan(children: spans);
  }

  Widget _buildPriceSection() {
    final price = book.price ?? '0';
    final discount = book.discount ?? 0;
    final priceAfterDiscount = book.priceAfterDiscount ?? 0.0;

    return Row(
      children: [
        Text(
          '\$$priceAfterDiscount',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryColor,
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          '\$$price',
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.grey[600],
            decoration: TextDecoration.lineThrough,
          ),
        ),
        if (discount > 0) ...[
          SizedBox(width: 8.w),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: Colors.red[100],
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Text(
              '-$discount%',
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
                color: Colors.red[700],
              ),
            ),
          ),
        ],
      ],
    );
  }
}
