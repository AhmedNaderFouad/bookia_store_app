import 'package:bookia_store_app/core/theme/app_text_style.dart';
import 'package:bookia_store_app/core/widgets/app_back_button.dart';
import 'package:bookia_store_app/core/widgets/app_text_form_field.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_color.dart';
import '../../../core/widgets/app_button.dart';
import '../../../gen/locale_keys.g.dart';
import '../../home/presentation/home_screen.dart';
import '../cubit/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                hintText: LocaleKeys.enter_your_email.tr(),
              ),
              SizedBox(height: 15.h),
              AppTextFormFiled(
                controller: passwordController,
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
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoadingState) {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => Center(
                        child: CircularProgressIndicator(
                          color: AppColor.primaryColor,
                        ),
                      ),
                    );
                  } else if (state is AuthErrorState) {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Error!"),
                          content: Text(
                            "Something Went Wrong Please Try Again",
                          ),
                        );
                      },
                    );
                  } else if (state is AuthSuccessSate) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                      (route) => false,
                    );
                  }
                },
                child: AppButton(
                  title: LocaleKeys.Login.tr(),
                  onTap: () {
                    context.read<AuthCubit>().login(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
