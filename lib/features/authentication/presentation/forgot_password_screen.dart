import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routing/routes.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../core/widgets/app_back_button.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_text_form_field.dart';
import '../../../gen/locale_keys.g.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBackButton(),
              SizedBox(height: 28.h),
              Text(
                LocaleKeys.forgot_password.tr(),
                style: AppTextStyle.text30Regular,
              ),
              SizedBox(height: 10.h),
              Text(
                LocaleKeys.forgot_password_message.tr(),
                style: const TextStyle(
                  color: Color(0xff8391A1),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 32.h),
              AppTextFormFiled(
                hintText: LocaleKeys.enter_your_email.tr(),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 38.h),
              AppButton(
                title: LocaleKeys.send_code.tr(),
                onTap: () {
                  Navigator.pushNamed(context, Routes.otpScreen);
                },
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.remember_password.tr(),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      LocaleKeys.Login.tr(),
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
