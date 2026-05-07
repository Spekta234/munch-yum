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

class MMenuCardVertical extends StatelessWidget {
  const MMenuCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => MenuDetails()),
      child: Container(
        width: 155,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            /// image
            SizedBox(height: 90, width: 170, child: MRoundedImage(margin: EdgeInsets.only(bottom: 2), imageUrl: MImages.shawarma,  fit: BoxFit.fill, )),
            MRoundedContainer(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(MSizes.xs),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          /// Ctgy title
                          MCtgyTitleTextWithIcon(
                            title: 'Shawarma',
                            textColor: MColors.darkerGrey,
                          ),
                          const SizedBox(height: MSizes.spaceBtwItems / 2),

                          /// Menu title
                          MMenuTitleText(title: 'Chicken Shawarma', smallSize: true,),
                          const SizedBox(height: MSizes.spaceBtwItems / 2),

                          /// Menu Price
                          MMenuPriceText(price: ' 3,200'),

                          const SizedBox(height: MSizes.spaceBtwSections),
                          AddToCartButton()
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

