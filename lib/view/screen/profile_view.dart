import 'package:el_hou/controller/profile_controller.dart';
import 'package:el_hou/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../core/constant/app_images.dart';
import '../../core/constant/app_sizes.dart';
import '../../core/style/app_padding.dart';
import '../widget/image_widget/app_circular_image.dart';
import '../widget/profile_widget/app_profile_menu.dart';
import '../widget/switch/app_switch.dart';

// ignore: must_be_immutable
class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  ProfileControllerImp controller = Get.put(ProfileControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        leading: Image.asset(AppImages.logoDark),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.screenPadding,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    AppCircularImage(
                      image: AppImages.user,
                      width: 120,
                      height: 120,
                    ),
                    SizedBox(height: AppSizes.spaceBtwItems / 2),
                    Text(
                      "Boulekzazel Tayeb",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(height: AppSizes.spaceBtwItems / 2),
                    Text(
                      "ttayeb769@gmail.com",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSizes.spaceBtwItems / 2),
              Divider(),
              SizedBox(height: AppSizes.spaceBtwItems),
              ProfileMenu(
                iconData: Iconsax.user,
                title: "Edit Profile",
                onTap: () {},
              ),
              ProfileMenu(
                iconData: Iconsax.notification,
                title: "Notification",
                onTap: () {},
              ),
              ProfileMenu(
                iconData: Iconsax.wallet,
                title: "Payment",
                onTap: () {},
              ),
              ProfileMenu(
                iconData: Iconsax.language_square,
                title: "Language",
                onTap: () {},
              ),
              Obx(
                () => ProfileMenu(
                  isIcon: false,
                  iconData: controller.isDarkMode.value
                      ? Iconsax.moon
                      : Iconsax.sun_1,
                  title: "Theme",
                  widget: AppSwitch(
                    onChanged: (value) {
                      controller.toggleTheme(value);
                    },
                    changed: controller.isDarkMode.value,
                  ),
                  onTap: () {},
                ),
              ),
              ProfileMenu(
                iconData: Iconsax.lock_circle,
                title: "Privacy Policy",
                onTap: () {},
              ),
              SizedBox(height: AppSizes.spaceBtwInputFields),
              Row(
                children: [
                  Icon(Iconsax.logout, size: 24, color: AppColors.error),
                  SizedBox(width: AppSizes.spaceBtwItems / 1.5),
                  Text(
                    "Logout",
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium!.apply(color: AppColors.error),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
