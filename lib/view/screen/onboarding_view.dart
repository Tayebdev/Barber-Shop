import 'package:flutter/material.dart';
import '../widget/onboarding_widget.dart/oboarding_next_button.dart';
import '../widget/onboarding_widget.dart/onboarding_dot_navigation.dart';
import '../widget/onboarding_widget.dart/onboarding_page.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          OnboardingPageView(),
          OnboardingDotNavigation(),
          OboardingNextButton(),
        ],
      ),
    );
  }
}
