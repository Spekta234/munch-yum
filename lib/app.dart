import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_yum/features/authentication/screens/onboarding/onboarding.dart';
import 'package:munch_yum/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MAppTheme.lightTheme,
      home:  const OnboardingScreen(),
    );
  }
}
