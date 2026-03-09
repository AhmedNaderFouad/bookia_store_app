import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_color.dart';
import '../../cubit/home_cubit.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is GetHomeSliderLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetHomeSliderSuccess) {
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                  height: 150.h,
                  autoPlay: true,
                  viewportFraction: 1,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                ),
                items: List.generate(state.slider.length, (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        state.slider[index].image ?? "",
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 14.h),
              AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: state.slider.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 7.h,
                  dotWidth: 7.w,
                  activeDotColor: AppColor.primaryColor,
                ),
              ),
            ],
          );
        } else if (state is GetHomeSliderError) {
          return const Center(child: Text("Error"));
        }
        return const SizedBox();
      },
    );
  }
}
