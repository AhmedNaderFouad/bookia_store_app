import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/app_color.dart';
import '../../../gen/assets.gen.dart';
import '../../cart/presentation/cart_screen.dart';
import '../../home/cubit/home_cubit.dart';
import '../../home/presentation/home_screen.dart';

import '../../profile/presentation/profile_screen.dart';
import '../../wishlist/presentation/wishlist_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int currentIndex = 0;

  List<Widget> screens = [
    BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),

      child: const HomeScreen(),
    ),

    WishlistScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.home,
              colorFilter: currentIndex == 0
                  ? ColorFilter.mode(AppColor.primaryColor, BlendMode.srcIn)
                  : null,
            ),

            label: "",
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.bookmark,
              colorFilter: currentIndex == 1
                  ? ColorFilter.mode(AppColor.primaryColor, BlendMode.srcIn)
                  : null,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.category,
              colorFilter: currentIndex == 2
                  ? ColorFilter.mode(AppColor.primaryColor, BlendMode.srcIn)
                  : null,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.profile,
              colorFilter: currentIndex == 3
                  ? ColorFilter.mode(AppColor.primaryColor, BlendMode.srcIn)
                  : null,
            ),
            label: "",
          ),
        ],
      ),
      body: SafeArea(child: screens[currentIndex]),
    );
  }
}
