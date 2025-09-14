import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/app_images.dart';
import '../../core/constant/app_routes.dart';
import '../../core/function/is_same_password.dart';
import '../../utils/helper/function_helpers.dart';
import '../../utils/popups/app_full_screen_loader.dart';

abstract class SignupController extends GetxController {
  toggleObscureText();
  goToLogin();
  signUp();
}

class SignupControllerImp extends SignupController {
  late TextEditingController? email;
  late TextEditingController? password;
  late TextEditingController? lastName;
  late TextEditingController? firsName;
  late TextEditingController? confirmPassword;
  late TextEditingController? phone;
  static SignupControllerImp get instance => Get.find();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool? obscureText = true;

  @override
  void toggleObscureText() {
    obscureText = !obscureText!;
    update();
  }

  @override
  void onInit() async {
    email = TextEditingController();
    password = TextEditingController();
    lastName = TextEditingController();
    firsName = TextEditingController();
    confirmPassword = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email!.dispose();
    password!.dispose();
    lastName!.dispose();
    firsName!.dispose();
    confirmPassword!.dispose();
    phone!.dispose();
    super.dispose();
  }

  @override
  goToLogin() {
    Get.toNamed(AppRoutes.login);
  }

  @override
  Future<void> signUp() async {
    if (!formState.currentState!.validate()) {
      return;
    }
    if (!isSamePassword(password!.text, confirmPassword!.text)) {
      AppHelperFunctions.warningSnackBar(
        title: "Password Mismatch",
        message: "Please make sure both password fields are identical.",
      );
      return;
    }

    try {
      HkFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        AppImages.docerAnimation,
      );
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!.text.trim(),
        password: password!.text.trim(),
      );
      HkFullScreenLoader.stopLoading();
      Get.offAllNamed(AppRoutes.login);
      AppHelperFunctions.successSnackBar(
        title: 'Success',
        message: 'Account created successfully!',
      );
    } on FirebaseAuthException catch (e) {
      HkFullScreenLoader.stopLoading();
      if (e.code == 'weak-password') {
        AppHelperFunctions.warningSnackBar(
          title: 'Weak Password',
          message: 'The password provided is too weak.',
        );
      } else if (e.code == 'email-already-in-use') {
        AppHelperFunctions.warningSnackBar(
          title: 'Email in use',
          message: 'An account already exists for that email.',
        );
      }
    } catch (e) {
      HkFullScreenLoader.stopLoading();
      AppHelperFunctions.errorSnackBar(
        title: "Error",
        message: "Something went wrong. Please try again later.",
      );
    }
  }
}
