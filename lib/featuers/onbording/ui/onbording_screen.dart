import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meleapp/core/helper/sixe_box.dart';
import 'package:meleapp/featuers/onbording/ui/widgets/button_app.dart';

import 'package:meleapp/featuers/onbording/ui/widgets/page_view_builder.dart';
import 'package:meleapp/featuers/onbording/ui/widgets/smooth_page_indicator.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final int newIndex = _pageController.page!.round();
      if (newIndex != currentIndex) {
        setState(() {
          currentIndex = newIndex;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 25.h),
        child: Column(
          children: [
            PageViewBuilderCustom(pageController: _pageController),
            SmoothPageIndicatorCustom(pageController: _pageController),
            verticalSpace(16.h),
            ButtonAppCustom(
                currentIndex: currentIndex, pageController: _pageController),
          ],
        ),
      ),
    );
  }
}
