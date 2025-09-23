import 'package:el_hou/core/style/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../core/constant/app_colors.dart';
import '../../core/constant/app_images.dart';
import '../../core/constant/app_sizes.dart';
import '../../data/static/static.dart';
import '../../utils/helper/function_helpers.dart';
import '../widget/circular_icon/app_circular_icon.dart';
import '../widget/image_widget/app_rounded_image.dart';
import '../widget/rounded_container/app_rounded_container.dart';
import '../widget/store_widget/grid_layout.dart';
import '../widget/store_widget/product_title_text.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Store", style: Theme.of(context).textTheme.headlineMedium),
        leading: Image.asset(AppImages.logoDark),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Iconsax.shopping_bag, size: AppSizes.iconMd),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.screenPadding,

          child: GridLayout(
            itemCount: 5,
            mainAxisCount: 280.5,
            itemBuilder: (context, index) {
              final service = storeList[index];
              return GestureDetector(
                onTap: () {},
                child: Container(
                  width: 180,
                  padding: const EdgeInsets.all(1),
                  //margin: EdgeInsets.symmetric(horizontal: AppSizes.xs,vertical: AppSizes.md),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.25),
                        spreadRadius: 7,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(
                      AppSizes.productImageRadius,
                    ),
                  ),
                  child: Column(
                    children: [
                      AppRoundedContainer(
                        width: 180,
                        backgroundColor: dark
                            ? AppColors.dark
                            : AppColors.light,
                        child: Stack(
                          children: [
                            AppRoundedImage(imageUrl: service["image"]),
                            Positioned(
                              top: 12.0,
                              left: 5,
                              child: AppRoundedContainer(
                                radius: AppSizes.sm,
                                backgroundColor: AppColors.primary.withOpacity(
                                  0.5,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppSizes.sm,
                                  vertical: AppSizes.xs,
                                ),
                                child: Text(
                                  '20%',
                                  style: Theme.of(context).textTheme.labelLarge!
                                      .apply(color: AppColors.black),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 5,
                              child: AppCircularIcon(
                                color: dark ? AppColors.light : AppColors.dark,
                                icon: Iconsax.heart,
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: AppSizes.spaceBtwItems / 2),
                      Padding(
                        padding: const EdgeInsets.only(left: AppSizes.sm),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppProductTitleText(
                              title: service["title_fr"],
                              smallSize: true,
                            ),
                            SizedBox(height: AppSizes.spaceBtwItems / 2),
                            Row(
                              children: [
                                Text(
                                  "Bata",
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(width: AppSizes.xs),
                                Icon(
                                  Iconsax.verify5,
                                  color: AppColors.primary,
                                  size: AppSizes.iconXs,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${service["price"].toString()} DA",
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineSmall,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(width: AppSizes.xl),
                                Container(
                                  width: AppSizes.iconLg * 1.2,
                                  height: AppSizes.iconLg * 1.2,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                        AppSizes.cardRadiusMd,
                                      ),
                                      bottomRight: Radius.circular(
                                        AppSizes.productImageRadius,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Iconsax.add,
                                        color: AppColors.light,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
