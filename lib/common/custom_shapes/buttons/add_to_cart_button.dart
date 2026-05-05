import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/common/custom_shapes/buttons/controller/add_to_cart_btn_controller.dart';
import 'package:munch_yum/utils/constants/sizes.dart';

import '../../../utils/constants/colors.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddToCartBtnController(), tag: UniqueKey().toString());
    return
      Obx(() => controller.isAddedToCart.value
          ?
      Padding(
        padding: const EdgeInsets.all(MSizes.xs),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Minus button
            GestureDetector(
              onTap: controller.decreaseQuality,
              child: CircleAvatar(
                radius: 14,
                backgroundColor: Colors.grey.shade200,
                child: Icon(Icons.remove, color: Colors.black, size: 25,),
              ),
            ),
            //
            Obx(() => Text(
              '${controller.quantity.value}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )),
            // Plus button
            GestureDetector(
              onTap: controller.increaseQuality,
              child: CircleAvatar(
                radius: 14,
                backgroundColor: MColors.primary,
                child: Icon(Icons.add, color: Colors.white, size: 25,),
              ),
            ),
          ],
        ),
      )
        :SizedBox(
      width:  double.infinity,
      child: ElevatedButton.icon(
        onPressed: controller.addToCart,
        icon: Icon(Iconsax.shopping_cart),
        label: Text('Add to cart'),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
          ),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
      )
    );
  }
}