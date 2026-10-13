import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/features/authentication/screens/login/widgets/heading_text.dart';
import 'package:munch_yum/features/personification/screens/loyalty/loyalty_history.dart';
import 'package:munch_yum/features/personification/screens/loyalty/widgets/reward_tier_card.dart';
import 'package:munch_yum/features/shop/controllers/home_controller.dart';
import 'package:munch_yum/utils/constants/image_strings.dart';
import 'package:munch_yum/utils/constants/sizes.dart';
import 'package:munch_yum/utils/snackbar/snack_bar.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/enums/enums.dart';

class LoyaltyProgramScreen extends StatelessWidget {
  const LoyaltyProgramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: MSizes.md,
            right: MSizes.md,
            top: MSizes.xs,
            bottom: MSizes.md,
          ),
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
                    onPressed: () => Get.to(() => LoyaltyHistory()),
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
                  child: Obx(() {
                    final user = HomeController.instance.user.value;
                    final life = user.lifeTimePoints;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 27,
                              backgroundImage: AssetImage(user.tier.avatar),
                              backgroundColor: Colors.transparent,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    user.fullName,
                                    style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 2),
                                  Row(
                                    children: [
                                      Image(width: 20, height: 20, image: AssetImage(MImages.lb)),
                                      const SizedBox(width: 4),
                                      Text(
                                        user.tier.label,
                                        style: Theme.of(context).textTheme.labelSmall!.copyWith(color: MColors.darkerGrey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: MSizes.spaceBtwItems),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Iconsax.discount_shape5, color: Colors.green.shade900, size: 30),
                                const SizedBox(width: 5),
                                Text(
                                  user.tierProgressLabel,
                                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w700, color: Colors.black),
                                ),
                              ],
                            ),
                            OutlinedButton.icon(
                              onPressed: () {
                                final pts = user.loyaltyPoints;
                                if (pts >= 20) {
                                  MSnackBar.successSnackBar(title: 'Points ready', message: 'Choose "Use 20 loyalty points" at checkout to save ₦3,000');
                                } else {
                                  MSnackBar.warningSnackBar(title: 'Not enough points', message: 'You need ${20 - pts} more points to redeem');
                                }
                              },
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
                        const SizedBox(height: 4),
                        Text('Redeemable points: ${user.loyaltyPoints}', style: Theme.of(context).textTheme.labelSmall), // CHANGED: the spendable balance
                        const SizedBox(height: MSizes.spaceBtwSections),

                        Text('Rewards', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black, fontWeight: FontWeight.w500)),
                        const SizedBox(height: MSizes.spaceBtwItems),

                        for (final t in LoyaltyTier.values)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: MRewardTierCard(
                              title: t.label,
                              progressValue: ((life - t.minPoints) / (t.maxPoints - t.minPoints)).clamp(0.0, 1.0),
                              trailingImage: MImages.category3,
                              isLocked: life < t.minPoints,
                              leadingWidget: life >= t.minPoints
                                  ? CircleAvatar(radius: 20, backgroundImage: AssetImage(t.avatar), backgroundColor: Colors.transparent)
                                  : null,
                              currentPoints: life >= t.minPoints ? life.clamp(0, t.maxPoints).toDouble() : 0.0,
                              maxPoints: t.maxPoints.toDouble(),
                            ),
                          ),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
