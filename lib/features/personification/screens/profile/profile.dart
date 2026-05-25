import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:munch_yum/features/personification/screens/profile/widgets/profile_avatar.dart';

import '../../../../common/widgets/avatar_bottomsheet/avatar_bottomsheet.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: MSizes.md, left: MSizes.md, top: MSizes.xs, bottom: MSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_ios_new), iconSize: 24,
                      ),
                      Text('Profile', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500)),
                    ],
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                          'Edit Profile', style: Theme.of(context).textTheme.labelSmall!.apply(
                        color: MColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: MColors.primary,))
                  ),
                ],
              ),
              const SizedBox(height: MSizes.spaceBtwItems),
              MProfileAvatar(name: '',)
            ],
          ),
        ),
      ),
    );
  }
}

