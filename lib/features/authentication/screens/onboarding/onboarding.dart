import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_yum/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:munch_yum/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:munch_yum/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:munch_yum/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:munch_yum/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:munch_yum/utils/constants/colors.dart';
import 'package:munch_yum/utils/constants/image_strings.dart';
import 'package:munch_yum/utils/device/device_utility.dart';
import 'package:munch_yum/utils/helpers/helper_function.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onPanDown: (_) => controller.onUserSwiped(),
            child: PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: [
                const OnBoardingPage(
                  image: MImages.onBoardingImage1,
                  title: 'Enjoy mouth watering meals',
                  subtitle:
                      'Our meals are fresh, delicious and made with so much love for you - a savory experience in every bite',
                ),
                const OnBoardingPage(
                  image: MImages.onBoardingImage2,
                  title: 'Order for delivery or pickup',
                  subtitle:
                      'You can place an order for swift delivery to your doorstep, or have a meal packed just in time for your pick up',
                ),

                const OnBoardingPage(
                  image: MImages.onBoardingImage3,
                  title: 'Share love with everyone',
                  subtitle:
                      'Order a meal or more for yourself and anyone where Munch Yum outlet is present. Taste the difference',
                ),

                const OnBoardingPage(
                  image: MImages.onBoardingImage4,
                  title: 'What are you waiting for',
                  subtitle:
                      'When every other thing is not in your control your food can be. Stop waiting and let\'s dive into sumptuousness',
                ),
              ],
            ),
          ),
          const OnboardingDotNavigation(),
          const OnboardingSkip(),
          const OnboardingNextButton(),
        ],
      ),
    );
  }
}
