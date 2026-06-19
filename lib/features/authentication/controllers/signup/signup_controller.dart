import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:munch_yum/features/authentication/screens/signup/verify_email.dart';

class SignupController extends GetxController {
 static SignupController get instance => Get.find();

 final hidePassword = true.obs;
 final signupFormKey = GlobalKey<FormState>();
 final fullName= TextEditingController();
 final email = TextEditingController();
 final phone = TextEditingController();
 final password = TextEditingController();
 void signup() {
   if (signupFormKey.currentState!.validate()) {
     // will handle Firebase logic here later
     Get.to(() => const VerifyEmail());
   }
 }
}