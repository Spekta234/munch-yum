import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_yum/common/styles/spacing_styles.dart';
import 'package:munch_yum/features/authentication/screens/login/widgets/heading_text.dart';
import 'package:munch_yum/features/personification/controllers/loyalty_controller.dart';
import 'package:munch_yum/features/personification/screens/loyalty/widgets/loyalty_registration_form.dart';

import '../../../../utils/constants/sizes.dart';

class LoyaltyRegistrationScreen extends StatelessWidget {
  const LoyaltyRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoyaltyController());
    return Scaffold(
      body: Padding(padding: MSpacingStyles.paddingWithAppBarHeight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              MHeadingText(
                title: 'Loyalty Program',
                subtitle: 'Fill in the right details here to get started',
                showGuestButton: false,
                hasSpace: true,
              ),
              SizedBox(height: MSizes.spaceBtwSections),
              const LoyaltyRegistrationForm()
            ],
          ),
        ),
      ),
    );
  }
}
