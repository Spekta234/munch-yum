import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:munch_yum/features/shop/models/menu_item_model.dart';
import 'package:munch_yum/utils/constants/image_strings.dart';
import 'package:munch_yum/utils/constants/sizes.dart';

import '../../../../../common/custom_shapes/buttons/add_to_cart_button.dart';
import '../../../../../utils/constants/colors.dart';
import '../../menu_details/menu_details.dart';

class MenuCardOffers extends StatelessWidget {
  const MenuCardOffers({
    super.key,
    required this.isOutOfStock,
    required this.hasDiscount,
    required this.title,
    required this.image,
    required this.price, required this.isCurved,
    this.onTap,
  });

  final bool isOutOfStock;
  final bool hasDiscount;
  final String title;
  final String image;
  final String price;
  final bool isCurved;
  final VoidCallback? onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: isCurved ? BorderRadius.circular(16) : BorderRadius.zero,
                child: SizedBox(
                  height: MSizes.imageCarouselHeight,
                  width: double.infinity,
                  child: Image.network(image, fit: BoxFit.cover),
                ),
              ),
              if (hasDiscount)
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.shade900,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Discount',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              if (isOutOfStock)
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: isCurved ? BorderRadius.circular(16) : BorderRadius.zero,
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Center(
                        child: Text(
                          'Out of stock',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              if (!isOutOfStock)
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: AddToCartButton(isCircle: true),
                ),
            ],
          ),
          const SizedBox(height: MSizes.sm),

          // ── Title and Price ──
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: MColors.darkerGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: MSizes.xs),
                Text(
                  '₦ $price',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
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
