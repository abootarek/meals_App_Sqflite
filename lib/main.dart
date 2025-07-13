import 'package:flutter/material.dart';
import 'package:meleapp/core/routing/app_routing.dart';


import 'package:meleapp/meals_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final DataBaseHelper databaseHelper = DataBaseHelper.dataBaseHelper;
  // databaseHelper.insertMeal(MealsModel(
  //   title: 'Hot Dog',
  //   image: 'assets/image/image1.jpg',
  //   raite: 4.5,
  //   description: 'delicious Hot Dog',
  //   date: '01-12',
  // ));
  // databaseHelper.insertMeal(MealsModel(
  //   title: 'Pizza',
  //   image: 'assets/image/image2.jpg',
  //   raite: 4.2,
  //   description: 'deliciousPizza',
  //   date: '10-11',
  // ));
  // databaseHelper.insertMeal(MealsModel(
  //   title: 'Pizza Hot Dog',
  //   image: 'assets/image/image3.jpg',
  //   raite: 4.7,
  //   description: 'delicious Pizza Hot Dog ',
  //   date: '8-11',
  // ));

  runApp(
    MealsApp(
      appRouting: AppRouting(),
    ),
  );
}
