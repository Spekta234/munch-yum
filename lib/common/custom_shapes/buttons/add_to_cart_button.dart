import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/common/custom_shapes/buttons/controller/add_to_cart_btn_controller.dart';
import 'package:munch_yum/features/shop/controllers/cart_controller.dart';
import 'package:munch_yum/utils/constants/sizes.dart';

import '../../../features/shop/models/menu_item_model.dart';
import '../../../utils/constants/colors.dart';

//
// class AddToCartButton extends StatelessWidget {
//   const AddToCartButton({
//     super.key,
//     this.isSmall = false,
//     this.isCircle = false,
//   });
//
//   final
//   final bool isSmall;
//   final bool isCircle;
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = CartController.instance; tag: UniqueKey().toString();
//     return Obx(() => controller.isAddedToCart.value
//         ? Padding(
//       padding: const EdgeInsets.all(MSizes.xs),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           GestureDetector(
//             onTap: controller.decreaseQuality,
//             child: CircleAvatar(
//               radius: isSmall ? 12 : 14,
//               backgroundColor: isCircle? Colors.black12 : Colors.grey.shade200,
//               child: Icon(Icons.remove, color: Colors.black, size: isSmall ? 20 : 25),
//             ),
//           ),
//           SizedBox(width: isSmall ? 10 : isCircle? 10 : null),
//           Obx(() => Text(
//             '${controller.quantity.value}',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: isSmall ? 16 : 16,
//             ),
//           )),
//           SizedBox(width: isSmall ? 10 : isCircle? 10 : null),
//           GestureDetector(
//             onTap: controller.increaseQuality,
//             child: CircleAvatar(
//               radius: isSmall ? 12 : 14,
//               backgroundColor: MColors.primary,
//               child: Icon(Icons.add, color: Colors.white, size: isSmall ? 20 : 25),
//             ),
//           ),
//         ],
//       ),
//     )
//         : isCircle
//     // ── Circle "+" button ──
//         ? GestureDetector(
//       onTap: controller.addToCart,
//       child: Container(
//         width: 40,
//         height: 40,
//         decoration: BoxDecoration(
//           color: MColors.primary,
//           shape: BoxShape.circle,
//         ),
//         child: Icon(Icons.add, color: Colors.white, size: 22),
//       ),
//     )
//     // ── Normal / Small button ──
//         : SizedBox(
//       height: isSmall ? 35 : null,
//       width: isSmall ? 100 : double.infinity,
//       child: ElevatedButton.icon(
//         onPressed: controller.addToCart,
//         icon: Icon(Iconsax.shopping_cart, size: isSmall ? 14 : 18),
//         label: Text(
//           'Add to cart',
//           style: TextStyle(fontSize: isSmall ? 11 : 14),
//         ),
//         style: ElevatedButton.styleFrom(
//           padding: EdgeInsets.symmetric(
//             vertical: isSmall ? 4 : 8,
//           ),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//           minimumSize: Size.zero,
//           tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//         ),
//       ),
//     ));
//   }
// }

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.menuItem,
    this.isSmall = false,
    this.isCircle = false,
  });

  final MenuItemModel menuItem;
  final bool isSmall;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Obx(() {
      final quantity =  controller.getQuantity(menuItem.id);
      final isInCart = quantity > 0;

      return isInCart
          ? Padding(
        padding: const EdgeInsets.all(MSizes.xs),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => controller.decreaseQuantity(menuItem.id),
              child: CircleAvatar(
                radius: isSmall ? 12 : 14,
                backgroundColor: isCircle ? Colors.black12 : Colors.grey.shade200,
                child: Icon(Icons.remove, color: Colors.black, size: isSmall ? 20 : 25),
              ),
            ),
            SizedBox(width: isSmall ? 10 : isCircle ? 10 : null),
            Text(
              '$quantity',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(width: isSmall ? 10 : isCircle ? 10 : null),
            GestureDetector(
              onTap: () => controller.increaseQuantity(menuItem.id),
              child: CircleAvatar(
                radius: isSmall ? 12 : 14,
                backgroundColor: MColors.primary,
                child: Icon(Icons.add, color: Colors.white, size: isSmall ? 20 : 25),
              ),
            ),
          ],
        ),
      )
          : isCircle
          ? GestureDetector(
        onTap: ()  => controller.addToCart(menuItem),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(color: MColors.primary, shape: BoxShape.circle),
          child: Icon(Icons.add, color: Colors.white, size: 22),
        ),
      )
          : SizedBox(
        height: isSmall ? 35 : null,
        width: isSmall ? 100 : double.infinity,
        child: ElevatedButton.icon(
          onPressed: () => controller.addToCart(menuItem),
          icon: Icon(Iconsax.shopping_cart, size: isSmall ? 14 : 18),
          label: Text('Add to cart', style: TextStyle(fontSize: isSmall ? 11 : 14)),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: isSmall ? 4 : 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
      );
    });
  }
}