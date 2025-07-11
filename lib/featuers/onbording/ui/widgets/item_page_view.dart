import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meleapp/core/theming/style_app.dart';
import 'package:meleapp/featuers/onbording/data/model.dart';

class ItemPageView extends StatelessWidget {
  const ItemPageView({
    super.key,
    this.onboardingModel,
  });

  final OnboardingModel? onboardingModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20.h,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25.r),
          child: Image.asset(
            alignment: Alignment.center,
            onboardingModel?.image ?? '',
            width: double.infinity,
            height: 300.h,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          onboardingModel?.title ?? '',
          style: TextStyles.font18DarkBlack,
          textAlign: TextAlign.center,
        ),
        Text(
          onboardingModel?.description ?? '',
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.grey[700],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
