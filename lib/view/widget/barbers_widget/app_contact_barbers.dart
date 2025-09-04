import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';
import '../circular_icon/app_circular_icon.dart';

// ignore: must_be_immutable
class AppContactBarbers extends StatelessWidget {
   AppContactBarbers({super.key,this.title,this.icon});

  String? title;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppCircularIcon(
          backgroundColor: AppColors.primary.withOpacity(0.4),
          height: 50,
          width: 50,
          icon: icon,
          color: AppColors.primary,
        ),
        SizedBox(height: AppSizes.spaceBtwItems / 2),
        Text(title!,style: Theme.of(context).textTheme.bodyMedium,),
      ],
    );
  }
}
