import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.title,
    required this.iconData,
    required this.onTap,
    this.isIcon = true,
    this.widget,
  });

  final String title;
  final bool isIcon;
  final IconData iconData;
  final Widget? widget;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.spaceBtwItems / 1.5,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 8,
              child: Row(
                children: [
                  Icon(iconData, size: 24, color: AppColors.primary),
                  SizedBox(width: AppSizes.spaceBtwItems / 1.5),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Expanded(
              child: isIcon
                  ? Icon(Iconsax.arrow_right_34, size: AppSizes.iconSm + 2)
                  : (widget ?? const SizedBox()),
            ),
          ],
        ),
      ),
    );
  }
}
