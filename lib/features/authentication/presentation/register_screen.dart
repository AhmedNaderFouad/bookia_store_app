import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;

import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../core/widgets/app_back_button.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_text_form_field.dart';
import '../../../gen/locale_keys.g.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppBackButton(),
                SizedBox(height: 22.h),
                Text(
                  LocaleKeys.register_page_statement.tr(),
                  style: AppTextStyle.text30Regular,
                ),
                SizedBox(height: 32.h),
                AppTextFormFiled(
                  hintText: LocaleKeys.enter_your_username.tr(),
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: 11.h),
                AppTextFormFiled(
                  hintText: LocaleKeys.enter_your_email.tr(),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 13.h),
                AppTextFormFiled(
                  hintText: LocaleKeys.enter_your_password.tr(),
                  isPassword: true,
                ),
                SizedBox(height: 12.h),
                AppTextFormFiled(
                  hintText: LocaleKeys.confirm_password.tr(),
                  isPassword: true,
                ),
                SizedBox(height: 30.h),
                AppButton(title: LocaleKeys.Register.tr()),
                SizedBox(height: 184.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.account_already_have.tr(),
                      style: TextStyle(
                        color: Color(0xff032426),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        LocaleKeys.login_now.tr(),
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
