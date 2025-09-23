import 'package:el_hou/core/constant/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../data/static/static.dart';
import '../../../utils/helper/function_helpers.dart';
import '../image_widget/app_rounded_image.dart';
import '../rounded_container/app_rounded_container.dart';

// ignore: must_be_immutable
class AppCardBarbers extends StatelessWidget {
  int? index;
  AppCardBarbers({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    final service = barberList[index!];
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.barbers),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: dark ? AppColors.darkerGrey : AppColors.grey,
          borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 5),
              child: AppRoundedContainer(
                height: 90,
                padding: const EdgeInsets.all(AppSizes.sm),
                backgroundColor: dark ? AppColors.dark : AppColors.light,
                child: SizedBox(
                  width: 90,
                  height: 90,
                  child: AppRoundedImage(
                    imageUrl: AppImages.test,
                    applayImageRadius: true,
                  ),
                ),
              ),
            ),
            SizedBox(width: AppSizes.spaceBtwItems),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service["name"],
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Row(
                  children: [
                    Icon(
                      Iconsax.timer_1,
                      color: AppColors.primary,
                      size: AppSizes.iconSm,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "${service["open"]} ${service["open"]}",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Iconsax.location,
                      color: AppColors.primary,
                      size: AppSizes.iconSm,
                    ),
                    SizedBox(width: 5),
                    Text(
                      service["distance"],
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Iconsax.star,
                      color: AppColors.primary,
                      size: AppSizes.iconSm,
                    ),
                    SizedBox(width: 5),
                    Text(
                      service["rating"],
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(width: 45),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Iconsax.heart, color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}
