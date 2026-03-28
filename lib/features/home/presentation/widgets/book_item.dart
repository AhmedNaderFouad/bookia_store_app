import 'package:bookia_store_app/core/routing/routes.dart';
import 'package:bookia_store_app/core/theme/app_text_style.dart';
import 'package:bookia_store_app/features/home/data/models/books_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/widgets/custom_image_network.dart';

class BookItem extends StatelessWidget {
  final ProductModel? book;
  const BookItem({super.key, this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.bookDetailsScreen,
          arguments: book?.id ?? 0,
        );
      },
      child: Container(
        padding: EdgeInsets.all(11.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColor.bookBackground,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: CustomImageNetwork(
                imageUrl: book?.image ?? "",
                height: 175.h,
                width: double.infinity,
              ),
            ),
            SizedBox(height: 5.h),
            Expanded(
              child: Text(
                book?.name ?? "",
                style: AppTextStyle.text18Regular,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    book?.price ?? "",
                    style: AppTextStyle.text15Regular.copyWith(fontSize: 16.sp),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 4.h,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Text(
                    "Buy",
                    style: AppTextStyle.text20Regular.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
