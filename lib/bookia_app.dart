import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'features/wishlist/cubit/wishlist_cubit.dart';

class BookiaApp extends StatelessWidget {
  final String? token;

  const BookiaApp({super.key, this.token});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider<WishlistCubit>(
          create: (_) => WishlistCubit(),
          child: MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: ThemeData(fontFamily: "DMSerifDisplay"),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter().generateRoute,
            initialRoute: startRoute(),
          ),
        );
      },
    );
  }

  String startRoute() {
    if (token == null || token!.isEmpty) {
      return Routes.welcomeScreen;
    } else {
      return Routes.bottomNavBarScreen;
    }
  }
}
