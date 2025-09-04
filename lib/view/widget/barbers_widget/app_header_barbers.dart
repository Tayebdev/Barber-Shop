import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';
import 'app_contact_barbers.dart';

class AppHeaderBarbers extends StatelessWidget {
  const AppHeaderBarbers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Boulekzazel Tayeb",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: Text(
                  "open",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
              ),
            ),
          ],
        ),
        SizedBox(height: AppSizes.spaceBtwItems),
        Column(
          children: [
            Row(
              children: [
                Icon(
                  Iconsax.location,
                  color: AppColors.primary,
                  size: AppSizes.iconSm,
                ),
                SizedBox(width: AppSizes.spaceBtwItems / 2),
                Text(
                  'The shop is located in Aïn Moussa, Sétif, Algeria.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            SizedBox(height: AppSizes.spaceBtwItems / 2),
            Row(
              children: [
                Icon(
                  Iconsax.star,
                  color: AppColors.primary,
                  size: AppSizes.iconSm,
                ),
                SizedBox(width: AppSizes.spaceBtwItems / 2),
                Text(
                  '4.8 (3.245 reviews)',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: AppSizes.spaceBtwSections),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppContactBarbers(icon: Icons.phone, title: "Call"),
            AppContactBarbers(icon: Icons.location_on, title: "Direction"),
            AppContactBarbers(icon: Icons.message, title: "Message"),
            AppContactBarbers(icon: Icons.public, title: "WebSite"),
            AppContactBarbers(icon: Icons.share, title: "Share"),
          ],
        ),
      ],
    );
  }
}
