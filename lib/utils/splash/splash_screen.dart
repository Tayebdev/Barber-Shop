import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../core/constant/app_colors.dart';
import '../../view/screen/application_view.dart';
import '../helper/function_helpers.dart';
import 'widgets/animated_logo.dart';
import 'widgets/animated_spinner.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
      splash: _buildSplashContent(context),
      splashIconSize: double.infinity,
      backgroundColor: Colors.transparent,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      nextScreen: ApplicationView(),
    );
  }

  Widget _buildSplashContent(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            color: dark ? AppColors.black : AppColors.primary,
          ),
        ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedLogo(),
              const SizedBox(height: 150),
              AnimatedLoadingSpinner(),
            ],
          ),
        ),
      ],
    );
  }
}
