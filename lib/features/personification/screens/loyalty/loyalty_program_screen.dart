import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/features/authentication/screens/login/widgets/heading_text.dart';
import 'package:munch_yum/features/personification/screens/loyalty/widgets/reward_tier_card.dart';
import 'package:munch_yum/utils/constants/image_strings.dart';
import 'package:munch_yum/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';


class LoyaltyProgramScreen extends StatelessWidget {
  const LoyaltyProgramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: MSizes.md, right: MSizes.md, top: MSizes.xs, bottom: MSizes.md,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Loyalty Program',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'History',
                      style: Theme.of(context).textTheme.labelSmall!.apply(
                        color: MColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: MColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: MSizes.md),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 27,
                            backgroundImage: AssetImage(MImages.loyaltyAvatar),
                            backgroundColor: Colors.transparent,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Okechukwu Onoh',
                                  style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 2),
                                Row(
                                  children: [
                                    Image(
                                      width: 20,
                                      height: 20,
                                      image: AssetImage(MImages.lb),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'Ruby Cruncher',
                                      style: Theme.of(context).textTheme.labelSmall!.copyWith(color: MColors.darkerGrey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: MSizes.spaceBtwItems),

                      /// Current Points Counter & Redeem Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Iconsax.discount_shape5, color: Colors.green.shade900, size: 30),
                              const SizedBox(width: 5),
                              Text(
                                '0.0/20 points',
                                style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w700, color: Colors.black),
                              )
                            ],
                          ),
                          OutlinedButton.icon(
                            onPressed: () {},
                            label: Text('Redeem Point', style: Theme.of(context).textTheme.labelLarge!.apply(color: MColors.darkerGrey)),
                            icon: const Icon(Iconsax.discount_shape, color: Colors.grey),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: MColors.lightGrey,
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              side: BorderSide.none,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: MSizes.spaceBtwSections),

                      /// Rewards Header Label
                      Text(
                        'Rewards',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: MSizes.spaceBtwItems),

                      /// The List of Tier Cards
                      MRewardTierCard(
                        title: 'Ruby Cruncher',
                        pointsText: '0.0/20 points',
                        progressValue: 0.0,
                        leadingWidget: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(MImages.loyaltyAvatar),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      const SizedBox(height: 12),
                      MRewardTierCard(
                        title: 'Bronze Cruncher',
                        pointsText: '0.0/50 points',
                        progressValue: 0.0,
                        isLocked: true,
                      ),
                      const SizedBox(height: 12),
                      MRewardTierCard(
                        title: 'Silver Cruncher',
                        pointsText: '0.0/100 points',
                        progressValue: 0.0,
                        isLocked: true,
                      ),
                      const SizedBox(height: 12),
                      MRewardTierCard(
                        title: 'Gold Cruncher',
                        pointsText: '0.0/200 points',
                        progressValue: 0.0,
                        isLocked: true,
                      ),
                      const SizedBox(height: 12),
                      MRewardTierCard(
                        title: 'Diamond Cruncher',
                        pointsText: '0.0/500 points',
                        progressValue: 0.0,
                        isLocked: true,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

