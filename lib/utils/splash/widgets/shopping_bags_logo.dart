import 'package:flutter/material.dart';

import '../../../core/constant/app_images.dart';
import '../../helper/function_helpers.dart';

class ShoppingBagsLogo extends StatelessWidget {
  const ShoppingBagsLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        children: [
          // ignore: avoid_unnecessary_containers
          Container(
            child: Image.asset(dark ? AppImages.logoDark : AppImages.logo),
          ),
        ],
      ),
    );
  }
}
