import 'package:flutter/material.dart';
import 'package:meleapp/core/routing/app_routing.dart';
import 'package:meleapp/meals_app.dart';

void main() {
  runApp(
    MealsApp(
      appRouting: AppRouting(),
    ),
  );
}
