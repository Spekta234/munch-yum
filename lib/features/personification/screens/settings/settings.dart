import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/features/personification/screens/settings/widgets/settings_header.dart';
import 'package:munch_yum/utils/constants/colors.dart';

import '../../../../utils/constants/sizes.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: MSizes.md, left: MSizes.md, top: MSizes.xs, bottom: MSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_ios_new), iconSize: 24,),
              MSettingsHeader(name: 'Okey', phoneNumber: '+234092038482943'),
              const SizedBox(height: MSizes.spaceBtwItems),
              Text('My Account', style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500)),
              const SizedBox(height: MSizes.spaceBtwItems,),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(Iconsax.profile_2user5, color: MColors.primary,),
                      const SizedBox(width: 10),
                      Text('Profile', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500)),
                    ],
                  ),
                  const Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded, size: 18,),
                ],
              ),
              const SizedBox(height: MSizes.lg),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(Iconsax.location5, color: MColors.primary,),
                      SizedBox(width: 10),
                      Text('Address', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500)),
                    ],
                  ),
                  const Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded, size: 18,),
                ],
              ),
              const SizedBox(height: MSizes.lg),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(Iconsax.shopping_cart5, color: MColors.primary,),
                      SizedBox(width: 10),
                      Text('My orders', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500)),
                    ],
                  ),
                  const Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded, size: 18,),
                ],
              ),
              const SizedBox(height: MSizes.lg),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(Iconsax.discount_shape5, color: MColors.primary,),
                      SizedBox(width: 10),
                      Text('Loyalty', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500)),
                    ],
                  ),
                  const Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded, size: 18,),
                ],
              ),
              const SizedBox(height: MSizes.spaceBtwSections),
              Text('More', style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500)),
              const SizedBox(height: MSizes.spaceBtwItems),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(Iconsax.messages5, color: MColors.primary,),
                      SizedBox(width: 10),
                      Text('Support', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500)),
                    ],
                  ),
                  const Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded, size: 18,),
                ],
              ),
              const SizedBox(height: MSizes.lg),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(Iconsax.info_circle5, color: MColors.primary,),
                      SizedBox(width: 10),
                      Text('About us', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500)),
                    ],
                  ),
                  const Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded, size: 18,),
                ],
              ),
              const SizedBox(height: MSizes.lg),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(Iconsax.document_text5, color: MColors.primary,),
                      SizedBox(width: 10),
                      Text('Terms & Conditions', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500)),
                    ],
                  ),
                  const Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded, size: 18,),
                ],
              ),
              const SizedBox(height: MSizes.lg),
              Row(
                children: [
                  Icon(Iconsax.logout5, color: MColors.primary,),
                  SizedBox(width: 10),
                  Text('Logout', style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.w500)),
                ],
              ),
              const SizedBox(height: MSizes.spaceBtwSections),
              Row(
                children: [
                  Icon(Iconsax.close_circle5, color: MColors.primary,),
                  SizedBox(width: 10),
                  Text('Delete Account', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: MColors.primary, fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
