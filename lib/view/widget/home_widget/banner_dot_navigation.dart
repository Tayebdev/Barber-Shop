import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/constant/app_colors.dart';

// ignore: must_be_immutable
class BannerDotNavigation extends StatelessWidget {
  BannerDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
        count: 4,
        effect: ExpandingDotsEffect(
          dotColor: AppColors.white,
          dotHeight: 6,
          dotWidth: 10,
          activeDotColor: AppColors.white,
        ),
        controller: PageController(),
      );

  }
}
