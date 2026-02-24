import 'package:bookia_store_app/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_color.dart';
import '../theme/app_text_style.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.title, this.backgroundColor, this.onTap});
  final String title;
  final Color? backgroundColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 14.h),
        alignment: Alignment.center,
      
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: backgroundColor ?? AppColor.primaryColor,
          border: Border.all(
            color: backgroundColor == Colors.white
                ? Colors.black
                : AppColor.primaryColor,
          ),
        ),
        child: Text(
          title,
          style: AppTextStyle.text15Regular.copyWith(
            color: backgroundColor == Colors.white ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
