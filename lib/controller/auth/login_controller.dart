import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/app_routes.dart';

abstract class LoginController extends GetxController {
  toggleObscureText();
  onLogin();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController? email;
  late TextEditingController? password;
  bool? obscureText = true;

  @override
  void toggleObscureText() {
    obscureText = !obscureText!;
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email!.dispose();
    password!.dispose();
    super.dispose();
  }

  @override
  goToSignUp() {
    Get.toNamed(AppRoutes.signup);
  }

  @override
  goToForgetPassword() {
    //Get.toNamed(AppRoutes.forgetPassword);
  }

  @override
  onLogin() async {
    Get.offAllNamed(AppRoutes.navigationMenu);
    // if (!formState.currentState!.validate()) {
    //   return;
    // }
    // try {
    //   statusRequest = StatusRequest.loading;
    //   AppFullScreenLoader.openLoadingDialog(
    //     'We are processing your information...',
    //     AppImages.docerAnimation,
    //   );
    //   update();
    //   final response = await myClass.postData(AppLinkApi.logIn, {
    //     "email": email!.text.trim(),
    //     "password": password!.text,
    //   });
    //   statusRequest = handlingData(response);
    //   AppFullScreenLoader.stopLoading();
    //   if (statusRequest == StatusRequest.success &&
    //       response['data']?['role'] == "user") {
    //     await appServices!.sharedPref.setBool("isLoggedIn", true);
    //     await appServices!.sharedPref.setString("token", response['token']);
    //     await appServices!.sharedPref.setString(
    //       "userId",
    //       response['data']['_id'],
    //     );
    //     await appServices!.sharedPref.setString(
    //       "firstName",
    //       response['data']['firstName'],
    //     );
    //     await appServices!.sharedPref.setString(
    //       "lastName",
    //       response['data']['lastName'],
    //     );
    //     await appServices!.sharedPref.setString(
    //       "email",
    //       response['data']['email'],
    //     );
    //     Get.offAllNamed(AppRoutes.navigationMenu);
    //   } else {
    //     AppHelperFunctions.warningSnackBar(
    //       title: "Oops!",
    //       message: "E-mail or password incorrect.",
    //     );
    //   }
    // } catch (e) {
    //   AppFullScreenLoader.stopLoading();
    //   AppHelperFunctions.errorSnackBar(
    //     title: "Error",
    //     message: "Something went wrong. Please try again later.",
    //   );
    // }
  }
}
