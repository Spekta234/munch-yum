import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_yum/features/personification/screens/loyalty/widgets/reward_tier_card.dart';
import 'package:munch_yum/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';

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
                  IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_ios_new), iconSize: 24,
                  ),
                  Text('History', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500)),
                ],
              ),
              const SizedBox(height: MSizes.spaceBtwItems),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage(MImages.loyaltyAvatar),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Okechukwu Maxwell', style: Theme.of(context).textTheme.titleLarge!
                                    .copyWith(fontWeight: FontWeight.w600),),
                                Row(
                                  children: [
                                    Image(image: AssetImage(MImages.lb), width: 20, height: 20),
                                    SizedBox(width: 4),
                                    Text('Ruby Cruncher', style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(color: MColors.darkerGrey),),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: LinearProgressIndicator(
                                          value: 0.0,
                                          minHeight: 6,
                                          backgroundColor: Colors.pink.withOpacity(0.15),
                                          valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    CircleAvatar(
                                      radius: 8,
                                      backgroundColor: Colors.pink.shade50,
                                      backgroundImage: AssetImage(MImages.category3
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text('0/20 points', style: Theme.of(context).textTheme.labelSmall),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: MSizes.spaceBtwItems),
                      Text('Level history', style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w500)),
                      const SizedBox(height: MSizes.spaceBtwItems),
                      MRewardTierCard(
                        title: 'Ruby Cruncher',
                        progressValue: 0.0,
                        currentPoints: 0,
                        maxPoints: 20,
                        leadingWidget: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(MImages.loyaltyAvatar),
                        ),
                        trailingImage: MImages.category3,
                      )
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
