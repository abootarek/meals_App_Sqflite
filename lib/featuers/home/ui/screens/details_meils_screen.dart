import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meleapp/core/helper/sixe_box.dart';
import 'package:meleapp/core/theming/colors_app.dart';
import 'package:meleapp/core/theming/style_app.dart';
import 'package:meleapp/featuers/home/data/models/meals_model.dart';

class DetailsMeilsScreen extends StatelessWidget {
  const DetailsMeilsScreen({
    super.key,
    this.mealsModel,
  });
  final MealsModel? mealsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.backGroundWhite,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          'Details Meals',
          style: TextStyles.font16DarkBlackSemiBold,
        ),
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: mealsModel!.image!,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Text(
              mealsModel!.title,
              style: TextStyles.font16DarkBlackSemiBold,
            ),
            verticalSpace(21.h),
            Container(
              width: double.infinity,
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.r),
                color: ColorsApp.mistyGrey,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Row(children: [
                  Text(
                    '⭐',
                    style: TextStyles.font16DarkBlackSemiBold,
                  ),
                  horizontalSpace(5.w),
                  Text(
                    mealsModel!.raite.toString(),
                    style: TextStyles.font16DarkBlackSemiBold,
                  ),
                  Spacer(),
                  Text(
                    ' 📅',
                    style: TextStyles.font16DarkBlackSemiBold,
                  ),
                  horizontalSpace(5.w),
                  Text(
                    mealsModel!.date.toString(),
                    style: TextStyles.font16DarkBlackSemiBold,
                  ),
                ]),
              ),
            ),
            verticalSpace(21.h),
            Divider(
              color: Colors.grey,
              thickness: 1,
              height: 20,
            ),
            verticalSpace(21.h),
            Text(
              'Description',
              style: TextStyles.font16DarkBlackSemiBold,
            ),
            verticalSpace(21.h),
            Text(
              mealsModel?.description ?? '',
              style: TextStyles.font16DarkBlackSemiBold,
            ),
          ],
        ),
      ),
    );
  }
}
