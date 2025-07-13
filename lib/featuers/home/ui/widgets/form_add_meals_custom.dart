import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meleapp/core/helper/sixe_box.dart';
import 'package:meleapp/core/theming/style_app.dart';
import 'package:meleapp/core/widgets/button_app.dart';
import 'package:meleapp/core/widgets/text_form_field_app.dart';
import 'package:meleapp/featuers/home/data/db_helper/db_helper.dart';
import 'package:meleapp/featuers/home/data/models/meals_model.dart';

class FormAddMealsCustom extends StatefulWidget {
  const FormAddMealsCustom({
    super.key,
  });

  @override
  State<FormAddMealsCustom> createState() => _FormAddMealsCustomState();
}

class _FormAddMealsCustomState extends State<FormAddMealsCustom> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DataBaseHelper dataBaseHelper = DataBaseHelper.dataBaseHelper;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 16.h,
        ),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            spacing: 10.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Meal Name',
                style: TextStyles.font16Black,
              ),
              AppTextFormField(
                controller: nameController,
                hintText: 'Add name meal',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Name meal';
                  }
                  return null;
                },
              ),
              Text(
                'Image URL',
                style: TextStyles.font16Black,
              ),
              AppTextFormField(
                controller: imageUrlController,
                maxLines: 3,
                hintText: 'Add image URL',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter image URL';
                  }
                  return null;
                },
              ),
              Text(
                'Type',
                style: TextStyles.font16Black,
              ),
              AppTextFormField(
                controller: typeController,
                keyboardType: TextInputType.multiline,
                hintText: ' Add type',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter type';
                  }
                  return null;
                },
              ),
              Text(
                'Time',
                style: TextStyles.font16Black,
              ),
              AppTextFormField(
                controller: timeController,
                keyboardType: TextInputType.number,
                hintText: ' Add time',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter time';
                  }
                  return null;
                },
              ),
              Text(
                'Description',
                style: TextStyles.font16Black,
              ),
              AppTextFormField(
                controller: descriptionController,
                maxLines: 4,
                hintText: ' Add description',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter description';
                  }
                  return null;
                },
              ),
              verticalSpace(3.h),
              AppTextButton(
                borderRadius: 8.0.r,
                buttonText: 'Add Meal',
                textStyle: TextStyles.font16White,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // showLoadingDialog(context);
                    MealsModel mealsModel = MealsModel(
                      title: nameController.text,
                      image: imageUrlController.text,
                      type: typeController.text,
                      date: timeController.text,
                      description: descriptionController.text,
                    );
                    dataBaseHelper.insertMeal(mealsModel);
                    nameController.clear();
                    imageUrlController.clear();
                    typeController.clear();
                    timeController.clear();
                    descriptionController.clear();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
