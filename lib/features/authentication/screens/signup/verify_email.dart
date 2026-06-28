import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:munch_yum/common/styles/spacing_styles.dart';
import 'package:munch_yum/data/repositories/authentication_repository.dart';
import 'package:munch_yum/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:munch_yum/features/authentication/screens/login/widgets/heading_text.dart';
import 'package:munch_yum/utils/constants/colors.dart';

import '../location/location.dart';
import '../login/widgets/logo_avatar.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        padding: MSpacingStyles.paddingWithAppBarHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => AuthenticationRepository.instance.logout(),
                icon: const Icon(Icons.close),
              ),
            ),

            const MHeadingText(
              title: 'Welcome to ',
              name: 'MUNCH YUM',
              subtitle: 'Check your email',
              showGuestButton: false,
            ),
            SizedBox(height: screenHeight * 0.14),

            const MLogoAvatar(
              showBorder: false,
              borderWidth: 2.3,
              child: Icon(Icons.mail_outlined, color: MColors.primary, size: 60,),
            ),
            SizedBox(height: screenHeight * 0.08),

            Center(
              child: Column(
                children: [
                  Text(
                    'Please check your inbox',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.grey.shade800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    email ?? '',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.1),

            Text(
              'We\'ve sent a verification link to your email address. Please open the email and click the link to verify your account',
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            SizedBox(height: screenHeight * 0.08),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.checkEmailVerificationStatus(),
                child: Text('Continue'),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => controller.sendEmailVerification(),
                style: OutlinedButton.styleFrom(
                  side: BorderSide.none
                ),
                child: Text('Resend email'),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
