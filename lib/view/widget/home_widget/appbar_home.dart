import 'package:flutter/material.dart';

import '../../../core/constant/app_sizes.dart';
import '../text_field/search_appbar.dart';

class AppbarHome extends StatelessWidget {
  const AppbarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Boulekzazel Tayeb",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: AppSizes.spaceBtwItems),
        SearchAppbar(),
      ],
    );
  }
}
