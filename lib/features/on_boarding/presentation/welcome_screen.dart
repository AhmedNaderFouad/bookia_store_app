import 'package:bookia_store_app/core/theme/app_text_style.dart';
import 'package:bookia_store_app/core/widgets/app_button.dart';
import 'package:bookia_store_app/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../gen/assets.gen.dart';
import '../../authentication/cubit/auth_cubit.dart';
import '../../authentication/presentation/login_screen.dart';
import '../../authentication/presentation/register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.splashBackground
                .image()
                .image,
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.0.w),
          child: Column(
            children: [
              SizedBox(height: 50.h),
              Row(
                children: [
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      if (context.locale.languageCode == "ar") {
                        context.setLocale(const Locale("en"));
                      } else {
                        context.setLocale(const Locale("ar"));
                      }
                    },
                    child: const Icon(Icons.language),
                  ),
                ],
              ),
              SizedBox(height: 153.h),
              Assets.images.logo.image(),
              SizedBox(height: 28.h),
              Text(
                LocaleKeys.on_Boarding_Statement.tr(),
                style: AppTextStyle.text20Regular,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              AppButton(
                title: LocaleKeys.Login.tr(),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        BlocProvider(
                          create: (context) => AuthCubit(),
                          child: LoginScreen(),
                        )),
                  );
                },
              ),
              SizedBox(height: 15.h),
              AppButton(
                title: LocaleKeys.Register.tr(),
                backgroundColor: Colors.white,
                onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                },
              ),
              SizedBox(height: 94.h),
            ],
          ),
        ),
      ),
    );
  }
}
