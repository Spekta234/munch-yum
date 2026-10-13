import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_yum/features/personification/screens/loyalty/widgets/reward_tier_card.dart';
import 'package:munch_yum/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/enums/enums.dart';
import '../../../../utils/helpers/navigation_helpers.dart';
import '../../../shop/controllers/home_controller.dart';

class LoyaltyHistory extends StatelessWidget {
  const LoyaltyHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: MSizes.md, left: MSizes.md, top: MSizes.xs, bottom: MSizes.md),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(onPressed: () => mBack(), icon: Icon(Icons.arrow_back_ios_new), iconSize: 24,
                  ),
                  Text('History', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500)),
                ],
              ),
              const SizedBox(height: MSizes.spaceBtwItems),
              Expanded(
                child: SingleChildScrollView(
                  child: Obx(() {
                    final user = HomeController.instance.user.value;
                    final reached = LoyaltyTier.values
                        .where((t) => user.lifeTimePoints >= t.minPoints)
                        .toList()
                        .reversed;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(radius: 24, backgroundImage: AssetImage(user.tier.avatar)),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(user.fullName, style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600)), // CHANGED
                                  Row(
                                    children: [
                                      Image(image: AssetImage(MImages.lb), width: 20, height: 20),
                                      const SizedBox(width: 4),
                                      Text(user.tier.label, style: Theme.of(context).textTheme.labelSmall!.copyWith(color: MColors.darkerGrey)),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: LinearProgressIndicator(
                                            value: user.tierProgress,
                                            minHeight: 6,
                                            backgroundColor: Colors.pink.withOpacity(0.15),
                                            valueColor: const AlwaysStoppedAnimation<Color>(Colors.pink),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      CircleAvatar(radius: 8, backgroundColor: Colors.pink.shade50, backgroundImage: AssetImage(MImages.category3)),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(user.tierProgressLabel, style: Theme.of(context).textTheme.labelSmall),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: MSizes.spaceBtwItems),
                        Text('Level history', style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w500)),
                        const SizedBox(height: MSizes.spaceBtwItems),
                        for (final t in reached)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: MRewardTierCard(
                              title: t.label,
                              progressValue: ((user.lifeTimePoints - t.minPoints) / (t.maxPoints - t.minPoints)).clamp(0.0, 1.0),
                              currentPoints: user.lifeTimePoints.clamp(0, t.maxPoints).toDouble(),
                              maxPoints: t.maxPoints.toDouble(),
                              leadingWidget: CircleAvatar(radius: 20, backgroundImage: AssetImage(t.avatar)),
                              trailingImage: MImages.category3,
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
