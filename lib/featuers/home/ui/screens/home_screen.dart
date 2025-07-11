import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meleapp/core/helper/navigation.dart';
import 'package:meleapp/core/helper/sixe_box.dart';
import 'package:meleapp/core/routing/routers_app.dart';
import 'package:meleapp/core/theming/colors_app.dart';
import 'package:meleapp/featuers/home/ui/widgets/grid_view_builder_custom.dart';
import 'package:meleapp/featuers/home/ui/widgets/stack_image_and_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        hoverElevation: 0,
        focusElevation: 0,
        elevation: 0,
        shape: const CircleBorder(
          side: BorderSide(
            color: ColorsApp.mainBlue,
            width: 3,
          ),
        ),
        backgroundColor: ColorsApp.whiteColor,
        child: const Icon(
          Icons.add,
          color: ColorsApp.mainBlue,
          size: 30,
        ),
        onPressed: () {
          context.pushNamed(Routes.addMeals);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StackImageAndTextCustom(),
            verticalSpace(25.h),
            GridViewBuilderCustom(),
          ],
        ),
      ),
    );
  }
}
