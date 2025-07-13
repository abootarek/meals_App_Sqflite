import 'package:flutter/material.dart';
import 'package:meleapp/core/theming/colors_app.dart';
import 'package:meleapp/featuers/home/ui/widgets/form_add_meals_custom.dart';
import 'package:meleapp/featuers/home/ui/widgets/popup_menu_button_custom.dart';

class AddMeals extends StatelessWidget {
  const AddMeals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                style: BorderStyle.solid,
                width: 2,
                color: Colors.black,
              ),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          PopupMenuButtonCustom(),
        ],
        scrolledUnderElevation: 0,
        backgroundColor: ColorsApp.backGroundWhite,
        centerTitle: true,
        title: const Text('Add Meals'),
      ),
      body: FormAddMealsCustom(),
    );
  }
}
