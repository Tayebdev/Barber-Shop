import 'package:el_hou/core/constant/app_colors.dart';
import 'package:el_hou/core/constant/app_images.dart';
import 'package:el_hou/core/constant/app_routes.dart';
import 'package:el_hou/core/constant/app_sizes.dart';
import 'package:el_hou/core/style/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplicationView extends StatelessWidget {
  const ApplicationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.screen),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 15,
            child: TextButton(
              onPressed: () => Get.offAllNamed(AppRoutes.onboarding),
              child: Text(
                "next",
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  // ignore: deprecated_member_use
                  colors: [Colors.black.withOpacity(0.98), Colors.transparent],
                ),
              ),
            ),
          ),
          Padding(
            padding: AppPadding.screenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Welcome to ✂️",
                  style: Theme.of(
                    context,
                  ).textTheme.headlineMedium!.apply(color: AppColors.white),
                ),
                SizedBox(height: AppSizes.spaceBtwItems),
                Text(
                  "El hou",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: AppSizes.spaceBtwItems),
                Text(
                  "Welcome to El Hou Barber Shop where style meets precision. Experience the best grooming tailored just for you.",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: AppColors.white),
                ),
                SizedBox(height: AppSizes.spaceBtwItems),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
