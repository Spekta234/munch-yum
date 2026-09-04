import 'package:flutter/material.dart';
import 'package:munch_yum/common/texts/m_ctgy_title_text_with_icon.dart';
import 'package:munch_yum/common/texts/menu_title_text.dart';
import 'package:munch_yum/features/shop/models/menu_item_model.dart';
import 'package:munch_yum/utils/constants/image_strings.dart';
import 'package:munch_yum/utils/constants/sizes.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../controllers/cart_controller.dart';

class CartItemWithImage extends StatelessWidget {
  const CartItemWithImage({super.key, required this.menuItem,});

  final MenuItemModel menuItem;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Row(
      children: [
        /// image
        CircleAvatar(
          radius: 23,
          backgroundImage: NetworkImage(menuItem.image),
        ),
        SizedBox(width: MSizes.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MMenuTitleText(title: menuItem.title),
              SizedBox(height: 11),
              MCtgyTitleTextWithIcon(title: menuItem.category)
            ],
          ),
        ),
        TextButton(
          onPressed: () => controller.addToCart(menuItem),
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
