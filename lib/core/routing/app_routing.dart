import 'package:flutter/material.dart';
import 'package:meleapp/core/routing/routers_app.dart';
import 'package:meleapp/featuers/home/data/models/meals_model.dart';
import 'package:meleapp/featuers/home/ui/screens/add_meals_screen.dart';
import 'package:meleapp/featuers/home/ui/screens/details_meils_screen.dart';
import 'package:meleapp/featuers/home/ui/screens/edit_meals_screen.dart';
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
      // Details Meals
      case Routes.detailsMeilsScreen:
        final mealsModel = settings.arguments as MealsModel;
        return MaterialPageRoute(
          builder: (_) => DetailsMeilsScreen(
            mealsModel: mealsModel,
          ),
        );
      // Edit Meals
      case Routes.editMeals:
        final mealsModel = settings.arguments as MealsModel;
        return MaterialPageRoute(
          builder: (_) => EditMealsScreen(
            mealsModel: mealsModel,
          ),
        );
      default:
        return null;
    }
  }
}
