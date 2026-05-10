import 'package:flutter/material.dart';
import 'package:munch_yum/common/texts/m_ctgy_title_text_with_icon.dart';
import 'package:munch_yum/common/texts/menu_title_text.dart';
import 'package:munch_yum/utils/constants/image_strings.dart';
import 'package:munch_yum/utils/constants/sizes.dart';

import '../../../../../utils/constants/colors.dart';

class CartItemWithImage extends StatelessWidget {
  const CartItemWithImage({super.key,});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// image
        CircleAvatar(
          radius: 23,
          backgroundImage: AssetImage(MImages.cheeseburger),
        ),
        SizedBox(width: MSizes.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MMenuTitleText(title: 'Cheeseburger'),
              SizedBox(height: 11),
              MCtgyTitleTextWithIcon(title: 'Food')
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            'Add to cart',
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: MColors.primary,
              decoration: TextDecoration.underline,
              decorationColor: MColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
