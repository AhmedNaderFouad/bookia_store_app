import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../gen/assets.gen.dart';
import '../theme/app_color.dart';
import '../theme/app_text_style.dart';

class AppTextFormFiled extends StatefulWidget {
  final String? hintText;
  final bool isPassword;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  const AppTextFormFiled({
    super.key,
    this.hintText,
    this.isPassword = false,
    this.keyboardType, this.controller,
  });

  @override
  State<AppTextFormFiled> createState() => _AppTextFormFiledState();
}

class _AppTextFormFiledState extends State<AppTextFormFiled> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      cursorColor: AppColor.primaryColor,
      obscureText: widget.isPassword && isObscure,
      onTapOutside: (value) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppTextStyle.text15Regular.copyWith(
          color: Color(0xff8391A1),
        ),
        fillColor: Color(0xffF7F8F9),
        filled: true,
        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.all(8.0.r),

                  child: isObscure
                      ? Icon(Icons.visibility_off)
                      : Icon(
                          Icons.visibility,
                        ), //SvgPicture.asset(Assets.icons.eyeIcon, width: 20.w),
                ),
              )
            : null,

        border: OutlineInputBorder(borderSide: BorderSide()),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryColor),
        ),
      ),
    );
  }
}
