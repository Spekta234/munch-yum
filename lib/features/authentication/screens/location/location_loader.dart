import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_yum/common/styles/spacing_styles.dart';
import 'package:munch_yum/features/authentication/controllers/location/location_controller.dart';
import 'package:munch_yum/features/authentication/screens/login/widgets/heading_text.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/enums/enums.dart';
import '../login/widgets/logo_avatar.dart';

class LocationLoadingScreen extends StatelessWidget {
  const LocationLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LocationController.instance;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: MSpacingStyles.paddingWithAppBarHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            const MHeadingText(
              title: 'Set Location',
              subtitle: 'Searching for the closest outlet to you....',
              showGuestButton: false,
            ),
            SizedBox(height: screenHeight * 0.10),

            /// loading logo
            Obx(
                  () => MLogoAvatar(
                    image: MImages.outlet,
                    showBorder: !controller.isLoading.value,
                    showLoader: controller.isLoading.value,
                  ),
            ),
            SizedBox(height: screenHeight * 0.16),

            /// Bottom text
            Obx(() => LocationController.instance.isLoading.value
                ? Text('...')
                : const SizedBox()
            ),

            SizedBox(height: screenHeight * 0.27),

            /// Contact Support
            Center(
              child: Text.rich(
                TextSpan(
                  text: 'Contact support',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: MColors.primary,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                    decorationColor: MColors.primary,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ),
            ),

          ],
        ),
        ),
      ),
    );
  }
}
