import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../core/routing/routes.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Assets.images.logo.image(width: 100.w),

        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(Routes.searchScreen);
          },
          child: SvgPicture.asset(Assets.icons.searchIcon),
        ),
      ],
    );
  }
}
