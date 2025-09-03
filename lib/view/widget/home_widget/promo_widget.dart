import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../core/style/app_padding.dart';
import 'banner_dot_navigation.dart';

class PromoWidget extends StatelessWidget {
  const PromoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
      ),
      child: Stack(
        children: [
          Padding(
            padding: AppPadding.screenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "30% OFF",
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              ),
                        ),
                        SizedBox(height: AppSizes.spaceBtwInputFields / 4),
                        Text(
                          "Today's Special",
                          style: Theme.of(context).textTheme.headlineMedium!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              ),
                        ),
                      ],
                    ),
                    Text(
                      "30%",
                      style: Theme.of(context).textTheme.displayMedium!
                          .copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.spaceBtwItems / 2),
                Text(
                  "Get a discount for every service order !\nOnly valid for today!",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: AppSizes.spaceBtwItems / 2),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Center(child: BannerDotNavigation()),
          ),
          SizedBox(height: AppSizes.spaceBtwItems / 2),
        ],
      ),
    );
  }
}
