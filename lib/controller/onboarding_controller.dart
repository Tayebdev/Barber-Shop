import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/services/app_service.dart';
import '../data/static/static.dart';

abstract class OnboardingController extends GetxController {
  nextPage();
  skipPage();
  upadtePageIndicator(int index);
  dotNavigationClick(int index);
}

class OnboardingControllerImp extends OnboardingController {
  static OnboardingControllerImp get instance => Get.find();
  final pageController = PageController();
  RxInt currentPage = 0.obs;

  @override
  upadtePageIndicator(index) {
    currentPage.value = index;
  }

  @override
  dotNavigationClick(index) {
    currentPage.value = index;
    pageController.jumpToPage(index);
  }

  @override
  nextPage() {
    AppServices? appServices = Get.find<AppServices>();
    if (currentPage.value == onboardingList.length - 1) {
      appServices.sharedPref.setBool("visited", true);
      //return Get.offAllNamed(AppRoutes.login);
    }
    currentPage.value++;
    pageController.jumpToPage(currentPage.value);
  }

  @override
  skipPage() {
    currentPage.value = onboardingList.length - 1;
    pageController.jumpToPage(currentPage.value);
  }
}
