import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../core/constant/app_colors.dart';
import '../../helper/function_helpers.dart';

class AnimatedLoadingSpinner extends StatelessWidget {
  const AnimatedLoadingSpinner({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Center(
      child: SpinKitSpinningLines(
        color: dark ? AppColors.primary : AppColors.black,
        size: 70.0,
        lineWidth: 3.0,
      ),
    );
  }
}
