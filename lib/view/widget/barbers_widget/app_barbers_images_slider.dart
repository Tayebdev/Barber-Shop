import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_images.dart';
import '../../../utils/helper/function_helpers.dart';
import '../appbar/appbar_widget.dart';
import '../circular_icon/app_circular_icon.dart';
import '../setting/app_curved_edge_widget.dart';

class AppProductImageSlider extends StatelessWidget {
  const AppProductImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return AppCurvedEdgesWidget(
      child: Container(
        color: dark ? AppColors.darkerGrey : AppColors.light,
        child: Stack(
          children: [
            SizedBox(
              height: 280,
              width: double.infinity,
              child: Image.asset(AppImages.product,fit: BoxFit.cover,),
            ),
            UAppBar(
              showBackArrow: true,
              actions: [
                AppCircularIcon(
                  icon: Iconsax.heart,
                  color: dark ? AppColors.light : AppColors.dark,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
