import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meleapp/core/theming/colors_app.dart';
import 'package:meleapp/featuers/onbording/data/demo_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothPageIndicatorCustom extends StatelessWidget {
  const SmoothPageIndicatorCustom({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: _pageController,
      count: demoData.length,
      effect: ExpandingDotsEffect(
        activeDotColor: ColorsApp.darkBlue,
        dotColor: ColorsApp.lightGray,
        dotHeight: 10.h,
        dotWidth: 12.w,
        expansionFactor: 4,
        spacing: 7.w,
      ),
    );
  }
}
