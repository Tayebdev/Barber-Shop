import 'package:el_hou/core/constant/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/app_sizes.dart';
import '../widget/barbers_widget/app_barber_haircut.dart';
import '../widget/barbers_widget/app_barber_work.dart';
import '../widget/barbers_widget/app_barbers_images_slider.dart';
import '../widget/barbers_widget/app_header_barbers.dart';
import '../widget/bottom_navigation_bar/app_bottom_navigation.dart';
import '../widget/map/app_map_barber.dart';

class BarbersDetailsView extends StatelessWidget {
  const BarbersDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomNavigation(
        onPressed: () => Get.toNamed(AppRoutes.booking),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppProductImageSlider(),
            Padding(
              padding: const EdgeInsets.only(
                left: AppSizes.defaultSpace,
                bottom: AppSizes.defaultSpace,
                right: AppSizes.defaultSpace,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppHeaderBarbers(),
                  const Divider(),
                  const SizedBox(height: AppSizes.spaceBtwSections / 4),
                  const AppBarberWork(),
                  const SizedBox(height: AppSizes.spaceBtwSections / 2),
                  const AppBarberHaircut(),
                  const SizedBox(height: AppSizes.spaceBtwSections / 2),
                  AppMapBarber(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
