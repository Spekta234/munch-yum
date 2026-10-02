import 'package:flutter/material.dart';
import 'package:munch_yum/features/shop/models/cart_item_model.dart';

import '../../../../../common/images/m_rounded_image.dart';
import '../../../../../common/texts/menu_price_text.dart';
import '../../../../../common/texts/menu_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';


class MOrderCardHorizontal extends StatelessWidget {
  const MOrderCardHorizontal ({
    super.key, required this.item,
  });

  final CartItemModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: MColors.grey,
          ),
          borderRadius: BorderRadius.circular(16)
      ),
      child: Row(
        children: [
          /// Image
          SizedBox(height: 75, width: 120, child: MRoundedImage(margin: EdgeInsets.only(right: 2),imageUrl: item.image!, fit: BoxFit.cover, isNetworkImage: true,  applyImageRadius: false,)),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MMenuTitleText(title: item.title, smallSize: true,),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MMenuPriceText(price: item.lineTotal.toStringAsFixed(0), ),
                        Text.rich(
                          TextSpan(
                              text: 'Qty: ',
                              style: Theme.of(context).textTheme.labelSmall,
                              children: [
                                TextSpan(
                                  text: '${item.quantity}',
                                  style: Theme.of(context).textTheme.labelSmall,
                                )
                              ]
                          ),
                        )
                    ],
                  ),
                ],
              ),
            ),)
        ],
      ),
    );
  }
}