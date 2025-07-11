import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meleapp/featuers/onbording/data/demo_data.dart';
import 'package:meleapp/featuers/onbording/ui/widgets/item_page_view.dart';

class PageViewBuilderCustom extends StatelessWidget {
  const PageViewBuilderCustom({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        allowImplicitScrolling: true,
        padEnds: false,
        controller: _pageController,
        itemCount: demoData.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: ItemPageView(
            onboardingModel: demoData[index],
          ),
        ),
      ),
    );
  }
}
