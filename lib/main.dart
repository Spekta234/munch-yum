import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:munch_yum/app.dart';
import 'package:munch_yum/data/repositories/authentication_repository.dart';
import 'package:munch_yum/firebase_options.dart';
import 'package:munch_yum/utils/local_storage/storage_utility.dart';

import 'data/repositories/user_repository.dart';


/// Entry point of flutter app
Future<void> main() async {
  /// Widgets Binding
   final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// -- Get X Local Storage
   await MLocalStorage.init('munch_yum');

  /// -- Await Splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);


  /// -- Initialize Firebase & Authentication Repository
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform).then(
      (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

   Get.put(UserRepository());

  // Load all the Material Design / Themes / Localization / Bindings
  runApp(const App());

   // Call screenRedirect after app is built
   AuthenticationRepository.instance.screenRedirect();
}