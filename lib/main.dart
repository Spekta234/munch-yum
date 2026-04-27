import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:munch_yum/app.dart';


/// Entry point of flutter app
Future<void> main() async {
  /// Widgets Binding
  // final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// -- Get X Local Storage

  /// -- Await Splash until other items load
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);


  /// -- Initialize Firebase & Authentication Repository


  // Load all the Material Design / Themes / Localization / Bindings
  runApp(const App());
}