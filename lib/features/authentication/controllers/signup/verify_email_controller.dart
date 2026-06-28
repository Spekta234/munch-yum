import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:munch_yum/data/repositories/authentication_repository.dart';
import 'package:munch_yum/features/authentication/screens/location/location.dart';
import 'package:munch_yum/utils/snackbar/snack_bar.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send email whenever verify email screen appears and set timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  // Send email verification screen
  Future<void> sendEmailVerification() async {
    try{
      await AuthenticationRepository.instance.sendMailVerification();
    } catch (e) {
      MSnackBar.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }

  // Timer to automatically redirect to email verification
  void setTimerForAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 6),
      (timer) async {
       await FirebaseAuth.instance.currentUser?.reload();
       final user = FirebaseAuth.instance.currentUser;
       if (user?.emailVerified ?? false) {
         timer.cancel();
         Get.off(() => LocationScreen(showBackButton: false));
       }
      },
    );
  }

  // Manually check if email is verified
  Future<void> checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => LocationScreen(showBackButton: false));
    }
  }


}