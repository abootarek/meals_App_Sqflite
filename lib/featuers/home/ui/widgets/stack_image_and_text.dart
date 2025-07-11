import 'package:flutter/material.dart';
import 'package:meleapp/core/theming/style_app.dart';

class StackImageAndTextCustom extends StatelessWidget {
  const StackImageAndTextCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            'assets/image/image5.png',
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 55,
            left: 55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome',
                  style: TextStyles.font32White,
                ),
                Text(
                  'Add A New ',
                  style: TextStyles.font32White,
                ),
                Text(
                  'Recipe',
                  style: TextStyles.font32White,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
