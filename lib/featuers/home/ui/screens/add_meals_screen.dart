import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meleapp/core/helper/sixe_box.dart';
import 'package:meleapp/core/theming/colors_app.dart';
import 'package:meleapp/core/theming/style_app.dart';
import 'package:meleapp/core/widgets/button_app.dart';
import 'package:meleapp/core/widgets/text_form_field_app.dart';

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
        scrolledUnderElevation: 0,
        backgroundColor: ColorsApp.backGroundWhite,
        centerTitle: true,
        title: const Text('Add Meals'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 16.h,
          ),
          child: Column(
            spacing: 10.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Meal Name',
                style: TextStyles.font16Black,
              ),
              AppTextFormField(
                hintText: '',
                validator: (value) {},
              ),
              Text(
                'Image URL',
                style: TextStyles.font16Black,
              ),
              AppTextFormField(
                maxLines: 3,
                hintText: '',
                validator: (value) {},
              ),
              Text(
                'Rate',
                style: TextStyles.font16Black,
              ),
              AppTextFormField(
                keyboardType: TextInputType.number,
                hintText: '',
                validator: (value) {},
              ),
              Text(
                'Time',
                style: TextStyles.font16Black,
              ),
              AppTextFormField(
                keyboardType: TextInputType.number,
                hintText: '',
                validator: (value) {},
              ),
              Text(
                'Description',
                style: TextStyles.font16Black,
              ),
              AppTextFormField(
                maxLines: 4,
                hintText: '',
                validator: (value) {},
              ),
              verticalSpace(3.h),
              AppTextButton(
                borderRadius: 8.0.r,
                buttonText: 'Add Meal',
                textStyle: TextStyles.font16White,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
