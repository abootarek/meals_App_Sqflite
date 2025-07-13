import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meleapp/core/helper/navigation.dart';
import 'package:meleapp/core/helper/sixe_box.dart';
import 'package:meleapp/core/routing/routers_app.dart';
import 'package:meleapp/core/theming/colors_app.dart';
import 'package:meleapp/core/theming/style_app.dart';
import 'package:meleapp/featuers/home/data/models/meals_model.dart';

class ItemGridViewCustom extends StatelessWidget {
  const ItemGridViewCustom({
    super.key,
    this.mealsModel,
  });
  final MealsModel? mealsModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          Routes.detailsMeilsScreen,
          arguments: mealsModel,
        );
      },
      child: Container(
        height: 250.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: ColorsApp.whiteColor),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            spacing: 8.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                width: double.infinity,
                height: 75.h,
                imageUrl: mealsModel!.image!,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  mealsModel!.title,
                  style: TextStyles.font16DarkBlackSemiBold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  Text(
                    ' 📅  ',
                    style: TextStyles.font16DarkBlackSemiBold,
                  ),
                  Text(
                    mealsModel!.date.toString(),
                    style: TextStyles.font16DarkBlackSemiBold,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
