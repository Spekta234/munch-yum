import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:munch_yum/data/repositories/authentication_repository.dart';
import 'package:munch_yum/utils/snackbar/snack_bar.dart';

class ReAuthController {
  static ReAuthController get instance => Get.find();

  final isLoading = false.obs;
  final hidePassword = false.obs;
  final password = TextEditingController();
  final hasPassword = false.obs;



  Future<bool> reAuthUser() async {
    try {
      isLoading.value = true;
      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(password.text);
      return true;
    } catch (e) {
      MSnackBar.errorSnackBar(title: 'An error occurred', message: e.toString());
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  void resetForm() {
    password.clear();
    hasPassword.value = false;
    hidePassword.value = true;
  }


}