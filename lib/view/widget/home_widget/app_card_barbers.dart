import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../utils/helper/function_helpers.dart';
import '../image_widget/app_rounded_image.dart';
import '../rounded_container/app_rounded_container.dart';

class AppCardBarbers extends StatelessWidget {
  const AppCardBarbers({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Container(
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
                  imageUrl: AppImages.logo,
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
                "Boulekzazel Tayeb",
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
                    "8:00h-19:00",
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
                    "1.2 Km",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Iconsax.star,
                    color: AppColors.primary,
                    size: AppSizes.iconSm,
                  ),
                  SizedBox(width: 5),
                  Text("4.8", style: Theme.of(context).textTheme.labelMedium),
                ],
              ),
            ],
          ),
          SizedBox(width: 65),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Iconsax.heart, color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
