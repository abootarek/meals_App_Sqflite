import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meleapp/core/helper/sixe_box.dart';
import 'package:meleapp/core/theming/colors_app.dart';
import 'package:meleapp/core/theming/style_app.dart';
import 'package:meleapp/featuers/home/data/db_helper/db_helper.dart';
import 'package:meleapp/featuers/home/ui/widgets/item_grid_view_builder.dart';

class GridViewBuilderCustom extends StatelessWidget {
  const GridViewBuilderCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final DataBaseHelper databaseHelper = DataBaseHelper.dataBaseHelper;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Food',
            style: TextStyles.font18DarkBlack,
          ),
          verticalSpace(25.h),
          FutureBuilder(
            future: databaseHelper.getAllMeals(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: ColorsApp.mainBlue,
                ));
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20.h,
                    crossAxisSpacing: 20.w,
                  ),
                  itemBuilder: (context, index) => ItemGridViewCustom(
                    mealsModel: snapshot.data![index],
                  ),
                );
              } else {
                return Center(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('No Data'),
                  ),
                );
              }
            },
          ),
          //verticalSpace(25.h),
        ],
      ),
    );
  }
}
