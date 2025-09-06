import 'package:el_hou/core/constant/app_images.dart';
import 'package:el_hou/core/constant/app_routes.dart';
import 'package:el_hou/core/constant/app_sizes.dart';
import 'package:el_hou/view/screen/home_view.dart';
import 'package:el_hou/view/screen/store_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'core/constant/app_colors.dart';
import 'utils/helper/function_helpers.dart';
import 'view/screen/profile_view.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    bool dark = AppHelperFunctions.isDarkMode(context);

    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () => Get.toNamed(AppRoutes.myBooking),
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
          ),
          child: Image.asset(AppImages.logo),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => NavigationBarTheme(
          data: NavigationBarThemeData(
            iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
              if (states.contains(WidgetState.selected)) {
                return IconThemeData(color: AppColors.primary);
              }
              return IconThemeData(
                color: dark ? AppColors.grey : AppColors.darkerGrey,
              );
            }),
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((
              states,
            ) {
              if (states.contains(WidgetState.selected)) {
                return TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                );
              }
              return TextStyle(
                color: dark ? AppColors.grey : AppColors.darkerGrey,
              );
            }),
          ),
          child: NavigationBar(
            elevation: 0,

            backgroundColor: dark ? AppColors.dark : AppColors.light,
            indicatorColor: dark
                ? AppColors.light.withValues(alpha: 0.1)
                : AppColors.dark.withValues(alpha: 0.1),
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) {
              controller.selectedIndex.value = index;
            },
            destinations: [
              NavigationDestination(
                icon: IconTheme(
                  data: IconThemeData(
                    color: controller.selectedIndex.value == 0
                        ? AppColors.primary
                        : (dark ? AppColors.grey : AppColors.darkerGrey),
                  ),
                  child: Icon(Iconsax.home),
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: IconTheme(
                  data: IconThemeData(
                    color: controller.selectedIndex.value == 1
                        ? AppColors.primary
                        : (dark ? AppColors.grey : AppColors.darkerGrey),
                  ),
                  child: Icon(Iconsax.shop),
                ),
                label: 'Store',
              ),
              NavigationDestination(
                icon: IconTheme(
                  data: IconThemeData(
                    color: controller.selectedIndex.value == 2
                        ? AppColors.primary
                        : (dark ? AppColors.grey : AppColors.darkerGrey),
                  ),
                  child: Icon(Iconsax.message),
                ),
                label: 'inbox',
              ),
              NavigationDestination(
                icon: IconTheme(
                  data: IconThemeData(
                    color: controller.selectedIndex.value == 3
                        ? AppColors.primary
                        : (dark ? AppColors.grey : AppColors.darkerGrey),
                  ),
                  child: Icon(Iconsax.user),
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  static NavigationController get instance => Get.find();
  RxInt selectedIndex = 0.obs;

  List<Widget> screens = [
    HomeView(),
    StoreView(),
    Center(child: Text("love")),
    ProfileView(),
  ];
}
