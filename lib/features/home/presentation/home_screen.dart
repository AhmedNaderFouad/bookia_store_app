import 'package:bookia_store_app/features/home/presentation/widgets/home_app_bar.dart';
import 'package:bookia_store_app/features/home/presentation/widgets/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.w),
          child: Column(
            children: [
              const HomeAppBar(),
              SizedBox(height: 20.h),
              const HomeSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
