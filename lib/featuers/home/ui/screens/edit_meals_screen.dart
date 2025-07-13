import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meleapp/core/theming/colors_app.dart';
import 'package:meleapp/core/theming/style_app.dart';
import 'package:meleapp/featuers/home/data/db_helper/db_helper.dart';
import 'package:meleapp/featuers/home/data/models/meals_model.dart';
import 'package:meleapp/featuers/home/ui/widgets/form_edit_meals_custom.dart';

class EditMealsScreen extends StatefulWidget {
  final MealsModel mealsModel;

  const EditMealsScreen({super.key, required this.mealsModel});

  @override
  State<EditMealsScreen> createState() => _EditMealsScreenState();
}

class _EditMealsScreenState extends State<EditMealsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final DataBaseHelper dataBaseHelper = DataBaseHelper.dataBaseHelper;

  @override
  void initState() {
    super.initState();
    nameController.text = widget.mealsModel.title;
    imageUrlController.text = widget.mealsModel.image ?? '';
    timeController.text = widget.mealsModel.date ?? '';
    descriptionController.text = widget.mealsModel.description ?? '';
    typeController.text = widget.mealsModel.type ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.backGroundWhite,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          'Edit Meals',
          style: TextStyles.font16DarkBlackSemiBold,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: FormEditMealsCustom(
          formKey: _formKey,
          nameController: nameController,
          imageUrlController: imageUrlController,
          timeController: timeController,
          descriptionController: descriptionController,
          type: typeController,
          dataBaseHelper: dataBaseHelper,
          mealsModel: widget.mealsModel,
        ),
      ),
    );
  }
}
