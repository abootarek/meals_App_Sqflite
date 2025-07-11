import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meleapp/core/routing/app_routing.dart';
import 'package:meleapp/core/routing/routers_app.dart';
import 'package:meleapp/core/theming/colors_app.dart';

class MealsApp extends StatelessWidget {
  const MealsApp({super.key, required this.appRouting});
  final AppRouting appRouting;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Hospital Management',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: ColorsApp.backGroundWhite,
        ),
        onGenerateRoute: appRouting.generateRoute,
        initialRoute: Routes.onBoardingScreen,
      ),
    );
  }
}
