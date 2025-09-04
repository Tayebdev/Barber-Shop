import 'package:flutter/material.dart';

import '../../../core/constant/app_sizes.dart';

class AppBarberWork extends StatelessWidget {
  const AppBarberWork({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Working Hours', style: Theme.of(context).textTheme.headlineSmall),
        SizedBox(height: AppSizes.spaceBtwSections / 4),
        Row(
          children: [
            Text("Monday-Friday", style: Theme.of(context).textTheme.bodySmall),
            SizedBox(width: AppSizes.spaceBtwItems),
            Text(
              ": 08:00 AM - 21:00 PM",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "Saturday-Sunday",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(width: AppSizes.spaceBtwItems),
            Text(
              ": 10:00 AM - 20:00 PM",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ],
    );
  }
}
