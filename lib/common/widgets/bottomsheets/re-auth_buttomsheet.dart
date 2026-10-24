import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/features/authentication/controllers/signup/signup_controller.dart';
import 'package:munch_yum/utils/constants/sizes.dart';

import '../../../utils/validators/validation.dart';

class ReAuthBottomSheet extends StatelessWidget {
  const ReAuthBottomSheet ({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: MSizes.md,
        bottom: 50,
        left: MSizes.md,
        right: MSizes.md,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  'Delete Account',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: MSizes.spaceBtwItems),
                Text(
                  'In order to delete your account you must provide your password below for security',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
          SizedBox(height: MSizes.spaceBtwSections),
          Form(
            child: TextFormField(
              
            ),
          ),
        ],
      ),
    );
  }
}
