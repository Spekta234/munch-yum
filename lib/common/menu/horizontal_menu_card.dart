import 'package:flutter/material.dart';
import 'package:munch_yum/features/shop/models/menu_item_model.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../images/m_rounded_image.dart';
import '../texts/menu_price_text.dart';
import '../texts/menu_title_text.dart';

class MMenuCardHorizontal extends StatelessWidget {
  const MMenuCardHorizontal ({
    super.key,
    required this.menuItem, this.onTap,
  });

  final MenuItemModel menuItem;
  final VoidCallback? onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: MColors.grey,
            ),
            borderRadius: BorderRadius.circular(16)
        ),
        child: Row(
          children: [
            /// Image
            SizedBox(height: 75,
                width: 120,
                child: Stack(children: [
                  MRoundedImage(
                    margin: EdgeInsets.only(right: 2),
                    imageUrl: menuItem.image,
                    fit: BoxFit.cover,
                    applyImageRadius: false,
                    isNetworkImage: true,
                  ),
                  if (menuItem.isOutOfStock)
                    Container(
                      margin: EdgeInsets.only(right: 2),
                      color: Colors.black.withOpacity(0.5),
                      alignment: Alignment.center,
                      child: Text(
                        'Out of\nStock',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelSmall!.apply(color: Colors.white),
                      ),
                    ),
                ])),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MMenuTitleText(title: menuItem.title, smallSize: true,),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MMenuPriceText(price: menuItem.hasDiscount == true && menuItem.isOutOfStock == false ? menuItem.discountPrice!.toStringAsFixed(0) : menuItem.price.toStringAsFixed(0), ),
                      ],
                    ),
                  ],
                ),
              ),)
          ],
        ),
      ),
    );
  }
}