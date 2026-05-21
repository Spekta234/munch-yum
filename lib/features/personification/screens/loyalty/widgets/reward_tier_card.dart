import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';

class MRewardTierCard extends StatelessWidget {
  final String title;
  final String pointsText;
  final double progressValue; // Between 0.0 and 1.0
  final bool isLocked;
  final Widget? leadingWidget;

  const MRewardTierCard({
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