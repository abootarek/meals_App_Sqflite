import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meleapp/core/helper/navigation.dart';
import 'package:meleapp/core/routing/routers_app.dart';
import 'package:meleapp/core/theming/colors_app.dart';
import 'package:meleapp/core/theming/style_app.dart';
import 'package:meleapp/featuers/onbording/data/demo_data.dart';

import '../../../../core/widgets/button_app.dart';

class ButtonAppCustom extends StatelessWidget {
  const ButtonAppCustom({
    super.key,
    required this.currentIndex,
    required PageController pageController,
  }) : _pageController = pageController;

  final int currentIndex;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      borderRadius: 8.0.r,
      buttonText: currentIndex == demoData.length - 1 ? 'Get Started' : 'Next',
      textStyle: TextStyles.font16White,
      onPressed: () {
        if (currentIndex < demoData.length - 1) {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        } else {
          context.pushNamed(Routes.homeScreen);
        }
      },
    );
  }
}
