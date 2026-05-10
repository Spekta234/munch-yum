import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_yum/common/styles/spacing_styles.dart';
import 'package:munch_yum/features/authentication/screens/login/widgets/heading_text.dart';
import 'package:munch_yum/features/authentication/screens/login/widgets/login_form.dart';
import 'package:munch_yum/features/authentication/screens/login/widgets/logo_avatar.dart';
import 'package:munch_yum/navigation_menu.dart';
import 'package:munch_yum/utils/constants/colors.dart';
import 'package:munch_yum/utils/constants/image_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: MSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Header ──
              /// Welcome texts
               MHeadingText(
                title: 'Welcome to ',
                name: 'MUNCH YUM',
                subtitle: 'Please enter your correct phone number below',
                showGuestButton: true,
                onTap: () => Get.to(() => NavigationMenu()),
              ),
              SizedBox(height: screenHeight * 0.05),

              // ── Logo ──
              const MLogoAvatar( image: MImages.loginLogo),
              SizedBox(height: screenHeight * 0.04),

              // ── Form ──
              const LoginForm(),

              // continue button

            ],
          ),
        ),
      ),
    );
  }
}

