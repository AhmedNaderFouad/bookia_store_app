import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routing/routes.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../core/widgets/app_back_button.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_text_form_field.dart';
import '../../../gen/locale_keys.g.dart';

class CreatePasswordScreen extends StatelessWidget {
  const CreatePasswordScreen({super.key});

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
                LocaleKeys.create_new_password.tr(),
                style: AppTextStyle.text30Regular,
              ),
              SizedBox(height: 10.h),
              Text(
                LocaleKeys.create_new_password_message.tr(),
                style: const TextStyle(
                  color: Color(0xff8391A1),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 32.h),
              AppTextFormFiled(
                hintText: LocaleKeys.new_password.tr(),
                isPassword: true,
              ),
              SizedBox(height: 15.h),
              AppTextFormFiled(
                hintText: LocaleKeys.confirm_password.tr(),
                isPassword: true,
              ),
              SizedBox(height: 38.h),
              AppButton(
                title: LocaleKeys.reset_password.tr(),
                onTap: () {
                  Navigator.pushNamed(context, Routes.passwordChangedScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
