import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_yum/bindings/general_bindings.dart';
import 'package:munch_yum/features/authentication/screens/onboarding/onboarding.dart';
import 'package:munch_yum/utils/constants/colors.dart';
import 'package:munch_yum/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GeneralBindings(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MAppTheme.lightTheme,
      home:  const Scaffold(
        backgroundColor: Colors.white,
        /// Show loader or Circular Progress Indicator meanwhile Authentication Repository is deciding to show relevant screen.
        body: Center(
          child: CircularProgressIndicator(
            color: MColors.primary,
          ),
        ),
      ),
    );
  }
}
