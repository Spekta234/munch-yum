import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:munch_yum/data/repositories/authentication_repository.dart';

class ReAuthController {
  static ReAuthController get instance => Get.find();

  final isLoading = false.obs;
  final hidePassword = false.obs;
  final password = TextEditingController();


  Future<void> reAuthUser(String password) async {
    try {
      isLoading.value = true;
      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(password);

    } catch (e) {
      throw 'Something went wrong, try again';
    }
  }
}