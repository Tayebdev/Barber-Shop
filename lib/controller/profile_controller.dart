import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProfileController extends GetxController {
  toggleTheme(bool value);
}

class ProfileControllerImp extends ProfileController {
  RxBool isDarkMode = true.obs;


  @override
  void toggleTheme(value) {
    isDarkMode.value = value;
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
  }

}
