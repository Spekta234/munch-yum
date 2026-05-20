import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/features/authentication/screens/login/widgets/heading_text.dart';
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
                      RewardTierCard(
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
                      RewardTierCard(
                        title: 'Bronze Cruncher',
                        pointsText: '0.0/50 points',
                        progressValue: 0.0,
                        isLocked: true,
                      ),
                      const SizedBox(height: 12),
                      RewardTierCard(
                        title: 'Silver Cruncher',
                        pointsText: '0.0/100 points',
                        progressValue: 0.0,
                        isLocked: true,
                      ),
                      const SizedBox(height: 12),
                      RewardTierCard(
                        title: 'Gold Cruncher',
                        pointsText: '0.0/200 points',
                        progressValue: 0.0,
                        isLocked: true,
                      ),
                      const SizedBox(height: 12),
                      RewardTierCard(
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

/// --- Reusable Reward Tier Card Component ---
class RewardTierCard extends StatelessWidget {
  final String title;
  final String pointsText;
  final double progressValue; // Between 0.0 and 1.0
  final bool isLocked;
  final Widget? leadingWidget;

  const RewardTierCard({
    super.key,
    required this.title,
    required this.pointsText,
    required this.progressValue,
    this.isLocked = false,
    this.leadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: MColors.lightGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Leading Icon / Status Badge Area
          if (isLocked)
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.pink.shade50,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.lock_outline, color: Colors.pink, size: 22),
            )
          else
            leadingWidget ?? const SizedBox(),

          const SizedBox(width: 12),

          /// Middle Content Area (Title + Progress Track)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 18),

                /// Linear Progress Row containing line tracking badge
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: progressValue,
                          minHeight: 6,
                          backgroundColor: Colors.pink.withOpacity(0.15),
                          valueColor: const AlwaysStoppedAnimation<Color>(Colors.pink),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    /// The small badge indicator sitting at the end of the bar
                    CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.pink.shade50,
                      backgroundImage: const AssetImage(MImages.category3), // Add your tiny trailing asset here
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  pointsText,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: MColors.darkerGrey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
