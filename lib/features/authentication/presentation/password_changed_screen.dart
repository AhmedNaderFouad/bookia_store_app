import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/routing/routes.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../core/widgets/app_button.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/locale_keys.g.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.icons.successIcon,
                width: 100.w,
                height: 100.h,
              ),
              SizedBox(height: 35.h),
              Text(
                LocaleKeys.password_changed.tr(),
                style: AppTextStyle.text30Regular,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.h),
              Text(
                LocaleKeys.password_changed_message.tr(),
                style: const TextStyle(
                  color: Color(0xff8391A1),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              AppButton(
                title: LocaleKeys.back_to_login.tr(),
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.loginScreen,
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
