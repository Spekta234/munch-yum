import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/common/texts/menu_title_text.dart';
import 'package:munch_yum/features/shop/screens/checkout/widgets/required_badge.dart';

import '../../../../../common/images/m_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class MOrderItemCard extends StatelessWidget {
  const MOrderItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          /// image
          SizedBox(
            height: 140,
            width: 130,
            child: MRoundedImage(
              imageUrl: MImages.phylloSandwich,
              margin: EdgeInsets.only(right: 2),
              fit: BoxFit.cover,
              applyImageRadius: false,
            ),
          ),
          
          /// content
          Expanded(
            child: Padding(padding: EdgeInsets.only(
              right: MSizes.sm,
              left: MSizes.sm,
              top: MSizes.xs,
              bottom: MSizes.xs,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: MMenuTitleText(title: 'Phyllo Sandwich', smallSize: true,)),
                    Container(
                      constraints: BoxConstraints(),
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        shape: BoxShape.rectangle,
                        color: MColors.pendingBackground,
                      ),
                      child: Text('Payment Pending', style: Theme
                          .of(context)
                          .textTheme
                          .labelSmall!
                          .apply(color: MColors.pendingForeground),),
                    )
                  ],
                ),
                const SizedBox(height: MSizes.xs),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('₦21,050', style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w600, color: Colors.black),),
                    Text('6 items', style: Theme.of(context).textTheme.labelSmall,)
                  ],
                ),
                SizedBox(height: MSizes.spaceBtwItems,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: Text('18, Charles street, beside shoprite, GRA Enugu', style: Theme.of(context).textTheme.labelSmall, overflow: TextOverflow.ellipsis,),),
                    SizedBox(width: 10,),
                    Text('1, May 2026', style: Theme.of(context).textTheme.labelSmall, overflow: TextOverflow.ellipsis,)
                  ],
                ),
                SizedBox(height: MSizes.sm,),
                Row(
                  children: [
                    // ── Get Help button ──
                    Expanded(
                      child: SizedBox(
                        height: 35,
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: Icon(Iconsax.messages, size: 16),
                          label: Text('Get Help'),
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            side: BorderSide(color: Colors.grey.shade300),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    // ── Reorder button ──
                    Expanded(
                      child: SizedBox(
                        height: 35,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Iconsax.shopping_cart, size: 16),
                          label: Text('Reorder'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
            ),
          )
        ],
      ),
    );
  }
}
