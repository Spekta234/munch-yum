import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:munch_yum/data/repositories/authentication_repository.dart';

import '../../../../utils/snackbar/snack_bar.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final isLoading = false.obs;
  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final storage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = storage.read('Remember_Me_Email') ?? '';
    password.text = storage.read('Remember_Me_Password') ?? '';
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
   try {
     // Start Loading
     isLoading.value = true;

     // Check internet connection

     // Form validation
     if (!loginFormKey.currentState!.validate()) {
       // Remove Loader
       isLoading.value = false;
       return;
     }

     // Save data if remember me is selected
     if (rememberMe.value) {
       storage.write('Remember_Me_Email', email.text.trim());
       storage.write('Remember_Me_Password', password.text.trim());
     }


     // Login user
     final userCredential  = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

     // Remove loader
     isLoading.value = false;

     // Redirect
     AuthenticationRepository.instance.screenRedirect();

   } catch (e) {
     // Remove loader
     isLoading.value = false;

     // Error to user
     MSnackBar.errorSnackBar(title: 'Oh Snap', message: e.toString());
   }
  }
}