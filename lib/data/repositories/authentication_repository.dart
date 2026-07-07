import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:munch_yum/features/authentication/screens/login/login.dart';
import 'package:munch_yum/features/authentication/screens/signup/verify_email.dart';
import 'package:munch_yum/navigation_menu.dart';
import 'package:munch_yum/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:munch_yum/utils/exceptions/firebase_exceptions.dart';
import 'package:munch_yum/utils/exceptions/format_exceptions.dart';
import 'package:munch_yum/utils/exceptions/platform_exceptions.dart';
import 'package:munch_yum/utils/local_storage/storage_utility.dart';

import '../../features/authentication/screens/location/location.dart';
import '../../features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Get authenticated User
  User? get authUser => _auth.currentUser;

  /// called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to show appropriate screen
  Future<void> screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      // user is logged in
      if (user.emailVerified) {
        // initialize user specific storage
        await MLocalStorage.init(user.uid);

        // Fetch user document from Firestore to check hasSelectedLocation
        final userDoc = await FirebaseFirestore.instance
            .collection("Users")
            .doc(user.uid)
            .get();

        final hasSelectedLocation = userDoc.data()?['HasSelectedLocation'] ?? false;

        if (hasSelectedLocation) {
          // User has selected location, navigate to navigation menu
          Get.offAll(() => const NavigationMenu());
        } else {
          // User has not selected location, navigate to location screen
          Get.offAll(() => LocationScreen(showBackButton: false));
        }
      } else {
        // if user email is not verified, navigate to email verification screen
        Get.offAll(() => VerifyEmail(email: _auth.currentUser?.email));
      }
    } else {
      deviceStorage.writeIfNull('IsFirstTime', true);
      // check if it's first time launching the app
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnboardingScreen());
    }
  }


  /// Email Authentication --- Register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e){
      throw MFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException().message;
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    }
    catch (e) {
      throw 'Something went wrong, Try again';
    }
  }

  /// Email Authentication --- Login
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    }  on FirebaseAuthException catch (e){
      throw MFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException().message;
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    }
    catch (e) {
      throw 'Something went wrong, Try again';
    }
  }

  /// Email verification link
  Future<void> sendMailVerification() async {
    try{
      await _auth.currentUser?.sendEmailVerification();
    }  on FirebaseAuthException catch (e){
      throw MFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException().message;
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    }
    catch (e) {
      throw 'Something went wrong, Try again';
    }
  }

  /// Reset password link
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e){
      throw MFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException().message;
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    }
    catch (e) {
      throw 'Something went wrong, Try again';
    }
  }

  /// Logout
  Future<void> logout() async {
    try{
      await _auth.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e){
      throw MFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException().message;
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    }
    catch (e) {
      throw 'Something went wrong, Try again';
    }
  }


}