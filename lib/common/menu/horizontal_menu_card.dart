import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../images/m_rounded_image.dart';
import '../texts/menu_price_text.dart';
import '../texts/menu_title_text.dart';

class MMenuCardHorizontal extends StatelessWidget {
  const MMenuCardHorizontal ({
    super.key, this.isQty = false,
  });

  final bool? isQty;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
            SizedBox(height: 75, width: 120, child: MRoundedImage(margin: EdgeInsets.only(right: 2),imageUrl: MImages.parfait, fit: BoxFit.cover, applyImageRadius: false,)),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MMenuTitleText(title: 'Parfait', smallSize: true,),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MMenuPriceText(price: '2,700', ),
                        if(isQty!)
                        Text.rich(
                          TextSpan(
                          text: 'Qty: ',
                            style: Theme.of(context).textTheme.labelSmall,
                            children: [
                              TextSpan(
                                text: '1',
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
      ),
    );
  }
}