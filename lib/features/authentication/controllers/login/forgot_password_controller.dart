import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_yum/data/repositories/authentication_repository.dart';
import 'package:munch_yum/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:munch_yum/utils/snackbar/snack_bar.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  final isLoading = false.obs;
  final email = TextEditingController();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  Future<void> sendPasswordResetEmail() async {
    try {
      // Start loading
      isLoading.value = true;

      // Form validation
      if (!forgotPasswordFormKey.currentState!.validate()) {
        // Remove Loader
        isLoading.value = false;
        return;
      }

      // send password reset email
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Stop loading
      isLoading.value = false;

      // Success message
      MSnackBar.successSnackBar(title: 'Email sent', message: 'Email link to resent your password');

      // Redirect
      Get.to(() => ResetPassword(email: email.text.trim()));

    } catch (e) {
      // Remove loader
      isLoading.value = false;

      // Error to user
      MSnackBar.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  void resendPasswordResetEmail(String email) async {
    try {
      // Start loading
      isLoading.value = true;

      // send password reset email
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove loader
      isLoading.value = false;

      // Success message
      MSnackBar.successSnackBar(title: 'Email sent', message: 'Email link to resent your password');

    } catch (e) {
      // Remove loader
      isLoading.value = false;

      // Error to user
      MSnackBar.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}