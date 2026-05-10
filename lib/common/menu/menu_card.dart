import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/common/custom_shapes/containers/rounded_container.dart';
import 'package:munch_yum/common/images/m_rounded_image.dart';
import 'package:munch_yum/common/texts/m_ctgy_title_text_with_icon.dart';
import 'package:munch_yum/common/texts/menu_price_text.dart';
import 'package:munch_yum/common/texts/menu_title_text.dart';
import 'package:munch_yum/features/shop/screens/menu_details/menu_details.dart' hide AddToCartButton;
import 'package:munch_yum/utils/constants/image_strings.dart';
import 'package:munch_yum/utils/constants/sizes.dart';

import '../../utils/constants/colors.dart';
import '../custom_shapes/buttons/add_to_cart_button.dart';

// class MMenuCardVertical extends StatelessWidget {
//   const MMenuCardVertical({super.key,});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => Get.to(() => MenuDetails()),
//       child: Container(
//         width: 155,
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: Colors.grey
//           ),
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Column(
//           children: [
//             /// image
//             SizedBox(height: 90, width: 170, child: MRoundedImage(margin: EdgeInsets.only(bottom: 2), imageUrl: MImages.ofadaRice2,  fit: BoxFit.fill, )),
//             MRoundedContainer(
//               child: Stack(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(MSizes.xs),
//                     child: SizedBox(
//                       width: double.infinity,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           /// Ctgy title
//                           MCtgyTitleTextWithIcon(
//                             title: 'Ofada Rice (wrapped)',
//                             textColor: MColors.darkerGrey,
//                           ),
//                           const SizedBox(height: MSizes.spaceBtwItems / 2),
//
//                           /// Menu title
//                           MMenuTitleText(title: 'Ofada Rice', smallSize: true,),
//                           const SizedBox(height: MSizes.spaceBtwItems / 2),
//
//                           /// Menu Price
//                           MMenuPriceText(price: '2,500',),
//
//                           const SizedBox(height: MSizes.spaceBtwSections),
//                           AddToCartButton()
//                         ],
//                       ),
//                     ),
//                   ),
//
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// class MMenuCardVertical extends StatelessWidget {
//   const MMenuCardVertical({
//     super.key,
//     this.isOutOfStock = false,
//     this.hasDiscount = false,
//   });
//
//   final bool isOutOfStock;
//   final bool hasDiscount;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => Get.to(() => MenuDetails()),
//       child: Container(
//         width: 155,
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey),
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 MRoundedContainer(
//                   child: Padding(
//                     padding: const EdgeInsets.all(MSizes.xs),
//                     child: SizedBox(
//                       width: double.infinity,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           // ── Image ──
//                           SizedBox(
//                             height: 90,
//                             width: 200,
//                             child: MRoundedImage(
//                               margin: EdgeInsets.only(bottom: 2),
//                               imageUrl: MImages.ofadaRice2,
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                           MCtgyTitleTextWithIcon(
//                             title: 'Ofada Rice (wrapped)',
//                             textColor: MColors.darkerGrey,
//                           ),
//                           const SizedBox(height: MSizes.spaceBtwItems / 2),
//                           MMenuTitleText(title: 'Ofada Rice', smallSize: true),
//                           const SizedBox(height: MSizes.spaceBtwItems / 2),
//                           MMenuPriceText(price: '2,500'),
//                           const SizedBox(height: MSizes.spaceBtwSections),
//                           // ── Hide button when out of stock ──
//                           if (!isOutOfStock) AddToCartButton(),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 // ── Discount badge ──
//                 if (hasDiscount)
//                   Positioned(
//                     top: 8,
//                     left: 8,
//                     child: Container(
//                       padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
//                       decoration: BoxDecoration(
//                         color: Colors.green,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Text(
//                         'Discount',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 10,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ),
//
//                 // ── Out of stock overlay ──
//                 if (isOutOfStock)
//                   Positioned.fill(
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(16),
//                       child: Container(
//                         color: Colors.black.withOpacity(0.5),
//                         child: Center(
//                           child: Text(
//                             'Out of stock',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 12,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class MMenuCardVertical extends StatelessWidget {
  const MMenuCardVertical({
    super.key,
    this.isOutOfStock = false,
    this.hasDiscount = false,
  });

  final bool isOutOfStock;
  final bool hasDiscount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>isOutOfStock ? null : Get.to(() => MenuDetails()),
      child: Container(
        width: 155,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                MRoundedContainer(
                  child: Padding(
                    padding: const EdgeInsets.all(MSizes.xs),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // ── Image ──
                          SizedBox(
                            height: 90,
                            width: 200,
                            child: MRoundedImage(
                              margin: EdgeInsets.only(bottom: 2),
                              imageUrl: MImages.ofadaRice2,
                              fit: BoxFit.fill,
                            ),
                          ),
                          MCtgyTitleTextWithIcon(
                            title: 'Ofada Rice (wrapped)',
                            textColor: MColors.darkerGrey,
                          ),
                          const SizedBox(height: MSizes.spaceBtwItems / 2),
                          MMenuTitleText(title: 'Ofada Rice', smallSize: true),
                          const SizedBox(height: MSizes.spaceBtwItems / 2),
                          MMenuPriceText(price: '2,500'),
                          SizedBox(height: isOutOfStock ? MSizes.spaceBtwSections / 2 : MSizes.spaceBtwSections),

                          // ── Button changes when out of stock ──
                          isOutOfStock
                              ? SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: null, // ← disabled
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey.shade400,
                                disabledBackgroundColor: Colors.grey.shade400,
                                padding: EdgeInsets.symmetric(vertical: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide.none
                                ),
                              ),
                              child: Text(
                                'Out of stock',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          )
                              : AddToCartButton(),
                        ],
                      ),
                    ),
                  ),
                ),

                // ── Discount badge ──
                if (hasDiscount)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Discount',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                // ── Out of stock overlay covers whole card ──
                if (isOutOfStock)
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        color: Colors.black.withOpacity(0.3), // ← covers whole card
                        child: Transform.translate(
                          offset: Offset(0, -70),
                          child: Center(
                            child: Text(
                              'Out of stock',
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white)
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}