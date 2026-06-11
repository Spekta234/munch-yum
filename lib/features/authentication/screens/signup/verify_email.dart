import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:munch_yum/common/styles/spacing_styles.dart';
import 'package:munch_yum/features/authentication/screens/login/widgets/heading_text.dart';
import 'package:munch_yum/utils/constants/colors.dart';

import '../location/location.dart';
import '../login/widgets/logo_avatar.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        padding: MSpacingStyles.paddingWithAppBarHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MHeadingText(
              title: 'Welcome to ',
              name: 'MUNCH YUM',
              subtitle: 'Check your email',
              showGuestButton: false,
            ),
            SizedBox(height: screenHeight * 0.14),

            const MLogoAvatar(
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
                    'spekta205@gmail.com', // ← replace with email later
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

            SizedBox(height: screenHeight * 0.17),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const LocationScreen(showBackButton: false,)),
                child: Text('Proceed to Mail App'),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
