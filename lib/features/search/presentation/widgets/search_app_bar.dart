import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bookia_store_app/core/theme/app_color.dart';


class SearchAppBar extends StatefulWidget {
  final TextEditingController searchController;
  final FocusNode focusNode;
  final Function(String) onSearchChanged;
  final VoidCallback onClear;
  final VoidCallback onCancel;

  const SearchAppBar({
    super.key,
    required this.searchController,
    required this.focusNode,
    required this.onSearchChanged,
    required this.onClear,
    required this.onCancel,
  });

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  late ValueNotifier<bool> _hasText;

  @override
  void initState() {
    super.initState();
    _hasText = ValueNotifier<bool>(false);
    widget.searchController.addListener(_updateClearButtonVisibility);
  }

  @override
  void dispose() {
    _hasText.dispose();
    widget.searchController.removeListener(_updateClearButtonVisibility);
    super.dispose();
  }

  void _updateClearButtonVisibility() {
    _hasText.value = widget.searchController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 70.h,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: widget.searchController,
                focusNode: widget.focusNode,
                onChanged: widget.onSearchChanged,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: AppColor.primaryColor,
                    size: 24.sp,
                  ),
                  suffixIcon: ValueListenableBuilder<bool>(
                    valueListenable: _hasText,
                    builder: (context, hasText, child) {
                      return hasText
                          ? IconButton(
                              icon: Icon(
                                Icons.close_rounded,
                                color: Colors.grey[600],
                                size: 24.sp,
                              ),
                              onPressed: widget.onClear,
                              tooltip: 'Clear search',
                            )
                          : const SizedBox.shrink();
                    },
                  ),
                  hintText: 'Search books, authors...',
                  hintStyle: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14.sp,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: Colors.grey[300]!,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: Colors.grey[300]!,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: AppColor.primaryColor,
                      width: 2,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                ),
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black87,
                ),
                textInputAction: TextInputAction.search,
                autocorrect: false,
                enableSuggestions: true,
              ),
            ),
            SizedBox(width: 12.w),
            GestureDetector(
              onTap: widget.onCancel,
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





