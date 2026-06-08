import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/features/personification/screens/address/address.dart';
import 'package:munch_yum/features/personification/screens/address/enter_address.dart';
import 'package:munch_yum/features/personification/screens/loyalty/loyalty_program_screen.dart';
import 'package:munch_yum/features/personification/screens/profile/profile.dart';
import 'package:munch_yum/features/personification/screens/settings/widgets/settings_header.dart';
import 'package:munch_yum/features/personification/screens/settings/widgets/settings_sections.dart';
import 'package:munch_yum/features/personification/screens/support/support.dart';
import 'package:munch_yum/features/shop/screens/orders/orders_screen.dart';
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
              MSettingsSections(icon: Iconsax.profile_2user5, title: 'Profile', onTap: () => Get.to(() => ProfileScreen()),),
              const SizedBox(height: MSizes.lg),
              MSettingsSections(icon: Iconsax.location5, title: 'Address', onTap: () => Get.to(() => Address())),
              const SizedBox(height: MSizes.lg),
              MSettingsSections(icon: Iconsax.shopping_cart5, title: 'My orders', onTap: () => Get.to(() => OrdersScreen())),
              const SizedBox(height: MSizes.lg),
              MSettingsSections(icon: Iconsax.discount_shape5, title: 'Loyalty', onTap: () => Get.to(() => LoyaltyProgramScreen())),
              const SizedBox(height: MSizes.spaceBtwSections),
              Text('More', style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500)),
              const SizedBox(height: MSizes.spaceBtwItems),
              MSettingsSections(icon: Iconsax.messages5, title: 'Support', onTap: () => Get.to(() => SupportScreen()) ),
              const SizedBox(height: MSizes.lg),
              MSettingsSections(icon: Iconsax.info_circle5, title: 'About us', onTap: () {}),
              const SizedBox(height: MSizes.lg),
              MSettingsSections(icon: Iconsax.document_text5, title: 'Terms & Conditions', onTap: () {}),
              const SizedBox(height: MSizes.lg),
              MSettingsSections(icon: Iconsax.logout5, title: 'Logout', onTap: () {}, showArrow: false),
              const SizedBox(height: MSizes.spaceBtwSections),
              MSettingsSections(icon: Iconsax.close_circle5, title: 'Delete Account', onTap: () {}, showArrow: true, titleColor: MColors.primary,),
            ],
          ),
        ),
      ),
    );
  }
}

