import 'package:flutter/material.dart';
import 'package:munch_yum/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constants/colors.dart';

class OnboardingDotNavigation extends StatelessWidget {
  const OnboardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    return Positioned(
      bottom: 200,
      left: 0,
      right: 0,
      child: Center(
        child: SmoothPageIndicator(
          controller: controller.pageController,
          count: 4,
          effect: const ExpandingDotsEffect(
            activeDotColor: MColors.primary,
            dotColor: MColors.grey,
            dotHeight: 8,
            dotWidth: 8,
            expansionFactor: 2,
          ),
        ),
      ),
    );
  }
}