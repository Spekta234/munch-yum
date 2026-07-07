import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_yum/features/authentication/controllers/login/forgot_password_controller.dart';
import 'package:munch_yum/features/authentication/screens/login/login.dart';
import 'package:munch_yum/features/authentication/screens/login/widgets/logo_avatar.dart';
import 'package:munch_yum/utils/constants/colors.dart';
import 'package:munch_yum/utils/constants/sizes.dart';

import '../../../../common/styles/spacing_styles.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: MSpacingStyles.paddingWithAppBarHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_ios_new)),
                IconButton(onPressed: () => Get.offAll(() => LoginScreen()), icon: Icon(Icons.close)),
              ],
            ),

            const SizedBox(height: MSizes.spaceBtwSections),
            MLogoAvatar(
              size: 70,
              showBorder: false,
              child: Icon(Icons.lock, color: MColors.primary, size: 70,),
            ),
            const SizedBox(height: MSizes.spaceBtwSections),

            Center(
              child: Column(
                children: [
                  Text(
                    'Password reset email sent',
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    email ?? '', // ← replace with email later
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: MSizes.spaceBtwItems),
                  Text(
                    'We\'ve sent you a Secure Link to safely change your password and keep your account protected',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),

            const SizedBox(height: MSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => Get.offAll(() => const LoginScreen()), child: Text('Done')),
            ),

            const SizedBox(height: MSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => ForgotPasswordController.instance.resendPasswordResetEmail(email ?? ''),
                style: OutlinedButton.styleFrom(
                  side: BorderSide.none
                ),
                child: Text('Resend Email'),
              ),
            ),

          ]
        ),
      ),
    );
  }
}
