import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../utils/helper/function_helpers.dart';

class AppBottomNavigation extends StatelessWidget {
  AppBottomNavigation({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.defaultSpace,
        vertical: AppSizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: dark ? AppColors.dark : AppColors.grey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSizes.cardRadiusLg),
          topRight: Radius.circular(AppSizes.cardRadiusLg),
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(AppSizes.md),
          backgroundColor: AppColors.primary,
          side: BorderSide(color: AppColors.primary),
        ),
        child: Text('Book Now'),
      ),
    );
  }
}
