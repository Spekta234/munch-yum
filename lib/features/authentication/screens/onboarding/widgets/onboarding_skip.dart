import 'package:flutter/material.dart';
import 'package:munch_yum/features/authentication/controllers/onboarding/onboarding_controller.dart';

import '../../../../../utils/constants/colors.dart';

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 90,
      left: 5,
      child: TextButton(
        onPressed: () => OnboardingController.instance.skipPage(),
        child: Text(
          'Skip',
          style: Theme.of(context).textTheme.bodySmall!.apply(color: MColors.textSecondary),
        ),
      ),
    );
  }
}