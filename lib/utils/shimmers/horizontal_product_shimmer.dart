import 'package:flutter/material.dart';
import 'package:munch_yum/utils/shimmers/shimmer.dart';

import '../constants/sizes.dart';

class EHorizontalProductShimmer extends StatelessWidget {
  const EHorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: MSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        separatorBuilder: (context, index) => const SizedBox(width: MSizes.spaceBtwItems),
        itemBuilder: (_, __) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Image
            MShimmerEffects(width: 120, height: 120),
            SizedBox(width: MSizes.spaceBtwItems),

            /// Text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: MSizes.spaceBtwItems / 2),
                MShimmerEffects(width: 160, height: 15),
                SizedBox(height: MSizes.spaceBtwItems / 2),
                MShimmerEffects(width: 110, height: 15),
                SizedBox(height: MSizes.spaceBtwItems / 2),
                MShimmerEffects(width: 80, height: 15),
                Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
