import 'package:flutter/material.dart';
import 'package:munch_yum/utils/shimmers/shimmer.dart';

import '../../../utils/constants/sizes.dart';
import '../../common/layout/grid_layout.dart';

class MMenuItemShimmer extends StatelessWidget {
  const MMenuItemShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return MGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => Container(
        width: 155,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(MSizes.xs),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  Image shimmer
              MShimmerEffects(width: double.infinity, height: 90, radius: 12),
              const SizedBox(height: MSizes.spaceBtwItems / 2),

              // Category text shimmer
              MShimmerEffects(width: 100, height: 10),
              const SizedBox(height: MSizes.spaceBtwItems / 2),

              // Title shimmer
              MShimmerEffects(width: 130, height: 12),
              const SizedBox(height: MSizes.spaceBtwItems / 2),

              // Price shimmer
              MShimmerEffects(width: 80, height: 12),
              const SizedBox(height: MSizes.spaceBtwSections),

              // Button shimmer
              MShimmerEffects(width: double.infinity, height: 35, radius: 8),
            ],
          ),
        ),
      ),
    );
  }
}
