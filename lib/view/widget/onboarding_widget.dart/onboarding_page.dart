import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../data/static/static.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key});
  static final controller = Get.put(OnboardingControllerImp());

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) => controller.upadtePageIndicator(value),
      itemCount: onboardingList.length,
      itemBuilder: (context, item) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Wrap image with Container for shadow + align at top
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  // ignore: deprecated_member_use
                  colors: [Colors.black.withOpacity(0.98), Colors.transparent],
                ),
              ),
              child: Image.asset(
                onboardingList[item].image!,
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
            SizedBox(height: AppSizes.spaceBtwInputFields * 3),
            Text(
              onboardingList[item].title!,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Text(
              onboardingList[item].body!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        );
      },
    );
  }
}
