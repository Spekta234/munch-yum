import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:munch_yum/features/authentication/screens/confirm_phoneno/widgets/confirme_phone_no_form.dart';
import 'package:munch_yum/features/authentication/screens/login/widgets/heading_text.dart';

import '../../../../common/styles/spacing_styles.dart';
import '../../../../utils/constants/image_strings.dart';
import '../login/widgets/logo_avatar.dart';

class ConfirmPhoneNoScreen extends StatelessWidget {
  const ConfirmPhoneNoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: MSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // -- Header --
              const MHeadingText(
               title: 'Welcome to ',
               name: 'MUNCH YUM.',
               subtitle: 'Please confirm your phone number',
               showGuestButton: false,
             ),
              SizedBox(height: screenHeight * 0.14),

              // -- Logo --
              const MLogoAvatar( image: MImages.phone, borderWidth: 2.3,),
              SizedBox(height: screenHeight * 0.08),

              // -- middle text returning phoneNo --
              Center(
                child: Column(
                  children: [
                    Text(
                      'Confirm your added phone number',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.grey.shade800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '081*******5251', // ← replace with controller.maskedPhone later
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.1),

              // -- form --
              const ConfirmPhoneNoForm(),
            ],
          ),
        ),
      ),
    );
  }
}

