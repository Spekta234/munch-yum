import 'package:flutter/material.dart';

import '../../../../../common/images/m_rounded_image.dart';
import '../../../../../common/texts/menu_price_text.dart';
import '../../../../../common/texts/menu_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';


class MOrderCardHorizontal extends StatelessWidget {
  const MOrderCardHorizontal ({
    super.key,
  });


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
          SizedBox(height: 75, width: 120, child: MRoundedImage(margin: EdgeInsets.only(right: 2),imageUrl: MImages.catfishPeppersoup, fit: BoxFit.cover, applyImageRadius: false,)),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MMenuTitleText(title: 'Catfish Peppersoup', smallSize: true,),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MMenuPriceText(price: '3,000', ),
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
    );
  }
}