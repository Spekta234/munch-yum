import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/features/authentication/screens/login/widgets/logo_avatar.dart';
import 'package:munch_yum/features/personification/screens/address/widgets/enter_address_textform_field.dart';
import 'package:munch_yum/utils/constants/colors.dart';
import 'package:munch_yum/utils/constants/image_strings.dart';
import 'package:munch_yum/utils/constants/sizes.dart';

class EnterAddress extends StatelessWidget {
  const EnterAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.all(MSizes.xs),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.arrow_back_ios_new),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: MSizes.xs, bottom: MSizes.md, left: MSizes.md, right: MSizes.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Enter delivery location', style: Theme.of(context).textTheme.headlineSmall),
                      const SizedBox(height: MSizes.sm),
                      Text('We use your location to deliver smoothly to you', style: Theme.of(context).textTheme.labelMedium),
                      SizedBox(height: screenHeight * 0.04),
                      MLogoAvatar(
                        showBorder: false,
                        size: 40,
                        child: Icon(Iconsax.location5, size: 40, color: MColors.primary,),
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      Center(
                        child: Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(
                            text: 'Ensure that your delivery location is within \n',
                            style: Theme.of(context).textTheme.bodySmall,
                            children: [
                              TextSpan(
                                text: 'Munch Yum Restaurant, Charles Street GRA, \nEnugu. ',
                                style: Theme.of(context).textTheme.bodyMedium!.apply(
                                  color: Colors.black
                                ),
                              ),
                              TextSpan(
                                text: 'as you maybe required to pay extra fees \nfor delivery to farther locations',
                                style: Theme.of(context).textTheme.bodySmall
                              ),
                            ]
                          ),
                        )
                      ),
                      const SizedBox(height: MSizes.spaceBtwSections),
                      Text('Enter Address', style: Theme.of(context).textTheme.bodyMedium),
                      const SizedBox(height: MSizes.sm),
                      const EnterAddressTextformField(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

