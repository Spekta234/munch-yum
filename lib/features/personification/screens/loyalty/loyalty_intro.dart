import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_yum/features/personification/screens/loyalty/loyalty_registration.dart';
import 'package:munch_yum/features/personification/screens/loyalty/widgets/loyalty_checkbox.dart';
import 'package:munch_yum/utils/constants/image_strings.dart';
import 'package:munch_yum/utils/constants/sizes.dart';

import '../../../../utils/helpers/helper_function.dart';

class LoyaltyIntro extends StatelessWidget {
  const LoyaltyIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(MSizes.md),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage(MImages.loyaltyIntro2),
                width: double.infinity,
                height: MHelperFunctions.screenHeight() * 0.5,
              ),
              const SizedBox(height: MSizes.spaceBtwItems),
              Text('Welcome to the \nCustomer Loyalty Program! 🎉', softWrap: true, style: Theme.of(context).textTheme.headlineSmall,),
              const SizedBox(height: MSizes.xs),
              Text('Earn rewards every time you order your favorite meals! \nHere\'s how it works:',style: Theme.of(context).textTheme.labelLarge, softWrap: true,),
              const SizedBox(height: MSizes.spaceBtwSections),
              LoyaltyCheckboxRow(title: 'Earn Points', description: 'Get points on every order made through the app or in a physical store.',),
              const SizedBox(height: MSizes.spaceBtwItems),
              LoyaltyCheckboxRow(title: 'Unlock Rewards', description: 'Redeem points for discounts, free meals, and exclusive deals.',),
              const SizedBox(height: MSizes.spaceBtwItems),
              LoyaltyCheckboxRow(title: 'Get VIP Perks', description: 'Enjoy special offers, birthday treats, and priority to new menu items.',),
              const SizedBox(height: MSizes.spaceBtwSections,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () => Get.to(() => LoyaltyRegistrationScreen()), child: Text('Get Started')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

