import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:munch_yum/features/authentication/screens/login/login.dart';
import 'package:munch_yum/features/authentication/screens/signup/verify_email.dart';
import 'package:munch_yum/navigation_menu.dart';
import 'package:munch_yum/utils/local_storage/storage_utility.dart';

import '../../features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Get authenticated User
  User get authUser => _auth.currentUser!;

  /// called from main.dart on app launch
  @override
  void onReady() {
    // Remove native splash screen
    FlutterNativeSplash.remove();
    // redirect to appropriate screen
    screenRedirect();
  }

  /// Function to show appropriate screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      // user is logged in
      if(user.emailVerified) {
        // initialize user specific storage
        await MLocalStorage.init(user.uid);

        // if user email is verified, navigate to navigation menu
        Get.offAll(() => const NavigationMenu());
      } else {
        // if user email is not verified, navigate to email verification screen
        Get.offAll(() => VerifyEmail(email: _auth.currentUser?.email));
      }
    } else {
      deviceStorage.writeIfNull('IsFirstTime', true);
      // check if it's first time launching the app
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(const OnboardingScreen());
    }
  }




}