import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_yum/common/styles/spacing_styles.dart';
import 'package:munch_yum/features/authentication/screens/login/widgets/logo_avatar.dart';
import 'package:munch_yum/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:munch_yum/utils/constants/sizes.dart';

import '../../../../utils/constants/image_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(padding: MSpacingStyles.paddingWithAppBarHeight,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
                width: 20,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.arrow_back_ios_new),
                ),
              ),
              const SizedBox(height: MSizes.spaceBtwSections),
              Text('Get Started', style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: MSizes.sm),
              Text('Join us and enjoy a better food experience', style: Theme.of(context).textTheme.labelMedium,),
              SizedBox(height: screenHeight * 0.03),
              MLogoAvatar(image: MImages.loginLogo, showBorder: false,),
              SizedBox(height: screenHeight * 0.03),
              const SignupForm(),
            ],
          ),
        ),
      ),
    );
  }
}
