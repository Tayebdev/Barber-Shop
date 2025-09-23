// ignore_for_file: file_names
import 'package:el_hou/core/constant/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../core/style/app_padding.dart';
import '../../../data/static/static.dart';
import '../../../utils/helper/function_helpers.dart';
import 'app_vertical_image_text.dart';

class AppServiceHome extends StatelessWidget {
  const AppServiceHome({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Padding(
      padding: AppPadding.screenPadding,
      child: SizedBox(
        height: 90,
        child: ListView.separated(
          separatorBuilder: (context, index) =>
              SizedBox(width: AppSizes.spaceBtwItems),
          scrollDirection: Axis.horizontal,
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            final category = categoryList[index];
            return AppVerticalImageText(
              title: category["title_ar"],
              image: category["image"],  
              onTap: () {
                Get.toNamed(AppRoutes.bookingPrice);
              },
              textColor: dark ? AppColors.white : AppColors.dark,
            );
          },
        ),
      ),
    );
  }
}
