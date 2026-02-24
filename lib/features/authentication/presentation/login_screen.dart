import 'package:bookia_store_app/core/theme/app_text_style.dart';
import 'package:bookia_store_app/core/widgets/app_back_button.dart';
import 'package:bookia_store_app/core/widgets/app_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/app_button.dart';
import '../../../gen/locale_keys.g.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBackButton(),
              SizedBox(height: 28.h),
              Text(
                LocaleKeys.welcome_Statement.tr(),
                style: AppTextStyle.text30Regular,
              ),
              SizedBox(height: 32.h),
              AppTextFormFiled(
                keyboardType: TextInputType.emailAddress,
                hintText: LocaleKeys.enter_your_email.tr(),
              ),
              SizedBox(height: 15.h),
              AppTextFormFiled(
                keyboardType: TextInputType.visiblePassword,
                hintText: LocaleKeys.enter_your_password.tr(),
                isPassword: true,
              ),
              SizedBox(height: 13.h),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    // Navigate
                  },
                  child: Text(
                    LocaleKeys.forgot_password.tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xff6A707C),
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              AppButton(title: LocaleKeys.Login.tr()),
            ],
          ),
        ),
      ),
    );
  }
}
