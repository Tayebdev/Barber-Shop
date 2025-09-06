import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../utils/helper/function_helpers.dart';
import '../image_widget/app_rounded_image.dart';

class AppBarberHaircut extends StatelessWidget {
  const AppBarberHaircut({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    int selectedIndex = 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Our Specialist", style: Theme.of(context).textTheme.headlineSmall),
        SizedBox(height: AppSizes.spaceBtwSections / 4),
        SizedBox(
          height: 80,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              bool isSelected = index == selectedIndex;
              return AppRoundedImage(
                imageUrl: AppImages.product,
                width: 80,
                backgroundColor: dark ? AppColors.dark : AppColors.light,
                border: Border.all(
                  color: isSelected ? AppColors.primary : Colors.transparent,
                  width: 2,
                ),
              );
            },
            separatorBuilder: (context, index) =>
                SizedBox(width: AppSizes.spaceBtwItems),
            itemCount: 7,
          ),
        ),
      ],
    );
  }
}
