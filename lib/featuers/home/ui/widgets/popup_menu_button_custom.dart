import 'package:flutter/material.dart';
import 'package:meleapp/core/helper/navigation.dart';
import 'package:meleapp/core/theming/colors_app.dart';
import 'package:meleapp/core/theming/style_app.dart';
import 'package:meleapp/core/widgets/text_form_field_app.dart';
import 'package:meleapp/featuers/home/data/db_helper/db_helper.dart';

class PopupMenuButtonCustom extends StatelessWidget {
  const PopupMenuButtonCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 2,
            color: ColorsApp.mainBlue,
          ),
        ),
        child: const Icon(
          Icons.menu,
          color: ColorsApp.mainBlue,
        ),
      ),
      onSelected: (value) async {
        if (value == 'delete_one') {
          TextEditingController idController = TextEditingController();
          await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'اكتب ID الوجبة اللي هتحذفها',
                  style: TextStyles.font16DarkBlackSemiBold,
                ),
              ),
              content: AppTextFormField(
                controller: idController,
                keyboardType: TextInputType.number,
                hintText: 'Ex : 1',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'ID الوجبة مطلوب';
                  }
                  return null;
                },
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    final id = int.tryParse(idController.text);
                    if (id != null) {
                      await DataBaseHelper.dataBaseHelper
                          .deleteOneMeal(id);
                      context.pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("✅ تم حذف الوجبة")),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("❌ ID غير صالح")),
                      );
                    }
                  },
                  child: const Text('حذف'),
                ),
                TextButton(
                  onPressed: () => context.pop(),
                  child: const Text('إلغاء'),
                ),
              ],
            ),
          );
        } else if (value == 'delete_all') {
          await DataBaseHelper.dataBaseHelper.deleteAllMeals();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("✅ تم حذف جميع الوجبات")),
          );
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem<String>(
          value: 'delete_one',
          child: Text('Delete One Meal'),
        ),
        const PopupMenuItem<String>(
          value: 'delete_all',
          child: Text('Delete All Meals'),
        ),
      ],
    );
  }
}
//Popup menu Flutter
