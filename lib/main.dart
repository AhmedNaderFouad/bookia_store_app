import 'package:bookia_store_app/bookia_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/helper/bloc_observer.dart';
import 'core/networking/dio_factory.dart';

// flutter pub get; flutter pub run build_runner build --delete-conflicting-outputs
// dart run easy_localization:generate --source-dir ./assets/translations -f keys -o locale_keys.g.dart -O lib/gen
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioFactory.init();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  //prefs.remove("token");

  String? token = prefs.getString("token") ?? "";

  await Future.wait([
    EasyLocalization.ensureInitialized(),
    ScreenUtil.ensureScreenSize(),
  ]);

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: BookiaApp(token: token),
    ),
  );
}
