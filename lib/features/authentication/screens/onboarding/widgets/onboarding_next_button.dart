import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_yum/features/authentication/controllers/onboarding/onboarding_controller.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    return Positioned(
      bottom: 90,
      right: 14,
      child: Obx(
        () => ElevatedButton(
          onPressed: () => controller.nextPage(),
          style: ElevatedButton.styleFrom(shape: StadiumBorder(), padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_forward),
              const SizedBox(width: 4),
              Text(
                controller.isLastPage ?
                'Get Started' : 'Next',
                style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}