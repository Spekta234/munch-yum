import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:munch_yum/data/models/user_model.dart';
import 'package:munch_yum/data/repositories/authentication_repository.dart';
import 'package:munch_yum/data/repositories/user_repository.dart';
import 'package:munch_yum/features/authentication/screens/signup/verify_email.dart';
import 'package:munch_yum/utils/snackbar/snack_bar.dart';

class SignupController extends GetxController {
 static SignupController get instance => Get.find();

 final isLoading = false.obs;
 final hidePassword = true.obs;
 final signupFormKey = GlobalKey<FormState>();
 final fullName= TextEditingController();
 final email = TextEditingController();
 final phone = TextEditingController();
 final password = TextEditingController();
 final userRepository = Get.put(UserRepository());


 void signup() async {
   try{
     // Start loading
     isLoading.value = true;

     // Check internet connection


     // Form validation
     if (!signupFormKey.currentState!.validate()) {
       // Remove Loader
       isLoading.value = false;
       return;
     }

     // Register user in the Firebase Authentication & Save user data in the Firebase
     final userCredential = await AuthenticationRepository.instance
         .registerWithEmailAndPassword(email.text.trim(), password.text.trim());

     // Save Authenticated user data in the Firebase Firestore
     final nameParts = UserModel.splitFullName(fullName.text.trim());
     final newUser = UserModel(
       id: userCredential.user!.uid,
       firstName: nameParts[0],
       lastName: nameParts[1],
       email: email.text.trim(),
       phoneNumber: phone.text.trim(),
       selectedOutlet: '',
       gender: '',
       dateOfBirth: '',
       loyaltyPoints: 0,
       loyaltyTier: '',
       hasSelectedLocation: false,
     );

     await userRepository.saveUserRecord(newUser);

     // Remove loader
     isLoading.value = false;

     // Success message
     MSnackBar.successSnackBar(title: 'Success', message: 'Your account has been successfully created');

     // Move to email verification screen
     Get.to(() => VerifyEmail(email: email.text.trim()));

   } catch (e) {
     // Remove loader
     isLoading.value = false;

     // Error to user
     MSnackBar.errorSnackBar(title: 'Oh Snap', message: e.toString());
   }
 }
}