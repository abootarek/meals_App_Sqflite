import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meleapp/core/helper/sixe_box.dart';
import 'package:meleapp/core/theming/colors_app.dart';
import 'package:meleapp/core/theming/style_app.dart';

class ItemGridViewCustom extends StatelessWidget {
  const ItemGridViewCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: ColorsApp.mistyGrey),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          spacing: 8.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/image/image5.png',
              height: 110.h,
              fit: BoxFit.cover,
            ),
            Text(
              'Cheese Burger',
              style: TextStyles.font16DarkBlackSemiBold,
            ),
            Row(children: [
              Text(
                '⭐',
                style: TextStyles.font16DarkBlackSemiBold,
              ),
              horizontalSpace(5.w),
              Text(
                '4.8',
                style: TextStyles.font16DarkBlackSemiBold,
              ),
              Spacer(),
              Text(
                '⭐',
                style: TextStyles.font16DarkBlackSemiBold,
              ),
              horizontalSpace(5.w),
              Text(
                '4.8',
                style: TextStyles.font16DarkBlackSemiBold,
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
