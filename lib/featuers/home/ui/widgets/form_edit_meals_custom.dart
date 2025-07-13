import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meleapp/core/helper/sixe_box.dart';
import 'package:meleapp/core/theming/style_app.dart';
import 'package:meleapp/core/widgets/button_app.dart';
import 'package:meleapp/core/widgets/show_loading_dialog.dart';
import 'package:meleapp/core/widgets/text_form_field_app.dart';
import 'package:meleapp/featuers/home/data/db_helper/db_helper.dart';
import 'package:meleapp/featuers/home/data/models/meals_model.dart';

class FormEditMealsCustom extends StatelessWidget {
  const FormEditMealsCustom({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.nameController,
    required this.imageUrlController,
    required this.timeController,
    required this.descriptionController,
    required this.dataBaseHelper,
    required this.mealsModel,
    required this.type,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController nameController;
  final TextEditingController imageUrlController;
  final TextEditingController timeController;
  final TextEditingController type;
  final TextEditingController descriptionController;
  final DataBaseHelper dataBaseHelper;
  final MealsModel mealsModel;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Meal Name', style: TextStyles.font16Black),
          AppTextFormField(
            controller: nameController,
            hintText: 'Add name meal',
            validator: (value) {},
          ),
          Text('Image URL', style: TextStyles.font16Black),
          AppTextFormField(
            controller: imageUrlController,
            maxLines: 3,
            hintText: 'Add image URL',
            validator: (value) {},
          ),
          Text('Time', style: TextStyles.font16Black),
          AppTextFormField(
            controller: timeController,
            keyboardType: TextInputType.number,
            hintText: ' Add time',
            validator: (value) {},
          ),
          Text('Type', style: TextStyles.font16Black),
          AppTextFormField(
            controller: type,
            keyboardType: TextInputType.multiline,
            hintText: ' Add type',
            validator: (value) {},
          ),
          Text('Description', style: TextStyles.font16Black),
          AppTextFormField(
            controller: descriptionController,
            maxLines: 4,
            hintText: ' Add description',
            validator: (value) {},
          ),
          verticalSpace(3.h),
          AppTextButton(
            borderRadius: 8.0.r,
            buttonText: 'Edit Meal',
            textStyle: TextStyles.font16White,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // showLoadingDialog(context);
                MealsModel updatedMeal = MealsModel(
                  id: mealsModel.id,
                  title: nameController.text,
                  image: imageUrlController.text,
                  date: timeController.text,
                  description: descriptionController.text,
                  type: type.text,
                );
                dataBaseHelper.updateMeal(updatedMeal);
                Navigator.pop(context, updatedMeal);
              }
            },
          ),
        ],
      ),
    );
  }
}
