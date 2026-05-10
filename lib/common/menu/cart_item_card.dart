import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/common/texts/m_ctgy_title_text_with_icon.dart';
import 'package:munch_yum/common/texts/menu_price_text.dart';
import 'package:munch_yum/common/texts/menu_title_text.dart';
import 'package:munch_yum/utils/constants/sizes.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../images/m_rounded_image.dart';

// class MCartItemCard extends StatelessWidget {
//   const MCartItemCard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100,
//       decoration: BoxDecoration(
//         border:  Border.all(
//           color:  Colors.grey,
//         ),
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Row(
//         children: [
//           /// image
//           SizedBox(height: 100, width: 120, child: MRoundedImage(imageUrl: MImages.smokedChicken, fit: BoxFit.cover, applyImageRadius: false,)),
//           Expanded(
//             child: Padding(padding: EdgeInsets.only(right: MSizes.sm, left: MSizes.sm, top: MSizes.xs, bottom: MSizes.xs ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       MMenuTitleText(title: 'Smoked Chicken', smallSize: true,),
//                       IconButton(onPressed: () {}, icon: Icon(Icons.delete))
//                     ],
//                   ),
//                   MCtgyTitleTextWithIcon(title: 'food'),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       MMenuPriceText(price: '4000'),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                              CircleAvatar(
//                               radius: 12,
//                               backgroundColor: Colors.grey.shade200,
//                               child: Icon(Icons.remove, color: Colors.black, size: 20),
//                             ),
//                            SizedBox(width: 10),
//                            Text(
//                              '1',
//                             style: TextStyle(
//                               fontSize:16,
//                             ),
//                           ),
//                           SizedBox(width: 10),
//                           CircleAvatar(
//                               radius: 12,
//                               backgroundColor: MColors.primary,
//                               child: Icon(Icons.add, color: Colors.white, size: 20),
//                             ),
//
//                         ],
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class MCartItemCard extends StatelessWidget {
  const MCartItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          /// image
           SizedBox(
              height: 90,
              width: 120,
              child: MRoundedImage(
                imageUrl: MImages.smokedChicken,
                margin: EdgeInsets.only(right: 2),
                fit: BoxFit.cover,
                applyImageRadius: false,
              ),
            ),

          /// Content
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                right: MSizes.sm,
                left: MSizes.sm,
                top: MSizes.xs,
                bottom: MSizes.xs,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Title and Delete
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: MMenuTitleText(title: 'Smoked Chicken', smallSize: true),
                      ),
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: IconButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          icon: Icon(Iconsax.trash, size: 18, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),

                  //Category
                  Align(
                    alignment: Alignment.centerLeft,
                    child: MCtgyTitleTextWithIcon(title: 'Protein'),
                  ),

                  SizedBox(height: 20,),
                  // price and quantity
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MMenuPriceText(price: '4,000'),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 9,
                            backgroundColor: Colors.grey.shade200,
                            child: Icon(Icons.remove, color: Colors.black, size: 15),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '1',
                            style: Theme.of(context).textTheme.labelSmall!.apply(color: Colors.black),
                          ),
                          SizedBox(width: 10),
                          CircleAvatar(
                            radius: 9,
                            backgroundColor: MColors.primary,
                            child: Icon(Icons.add, color: Colors.white, size: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
