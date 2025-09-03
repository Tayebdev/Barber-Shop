import 'package:el_hou/core/constant/app_images.dart';
import 'package:el_hou/core/constant/app_sizes.dart';
import 'package:el_hou/view/widget/home_widget/appbar_home.dart';
import 'package:el_hou/view/widget/home_widget/promo_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../widget/home_widget/app_barbers.dart';
import '../widget/home_widget/app_service_home.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "El hou",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        leading: Image.asset(AppImages.logoDark),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Iconsax.notification, size: AppSizes.iconMd),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Iconsax.heart, size: AppSizes.iconMd),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: AppSizes.defaultSpace,
              ),
              child: AppbarHome(),
            ),
            SizedBox(height: AppSizes.spaceBtwItems),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: AppSizes.defaultSpace,
              ),
              child: PromoWidget(),
            ),
            AppSerivceHome(),
            AppBarbers()
          ],
        ),
      ),
    );
  }
}
