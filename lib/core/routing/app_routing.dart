import 'package:flutter/material.dart';
import 'package:meleapp/core/routing/routers_app.dart';
import 'package:meleapp/featuers/home/ui/screens/add_meals_screen.dart';
import 'package:meleapp/featuers/home/ui/screens/home_screen.dart';
import 'package:meleapp/featuers/onbording/ui/onbording_screen.dart';

class AppRouting {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // onBoarding screen
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => OnbordingScreen(),
        );
      // Home screen
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
      // Add Meals
      case Routes.addMeals:
        return MaterialPageRoute(
          builder: (_) => AddMeals(),
        );
      default:
        return null;
    }
  }
}
