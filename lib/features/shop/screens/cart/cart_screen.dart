import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/common/menu/cart_item_card.dart';
import 'package:munch_yum/features/authentication/screens/login/widgets/heading_text.dart';
import 'package:munch_yum/features/shop/controllers/menu_item_controller.dart';
import 'package:munch_yum/features/shop/screens/cart/widgets/cart_item_with_image.dart';
import 'package:munch_yum/features/shop/screens/checkout/checkout_screen.dart';
import 'package:munch_yum/features/shop/screens/home/home_screen.dart';
import 'package:munch_yum/features/shop/screens/orders/orders_screen.dart';
import 'package:munch_yum/navigation_menu.dart';
import 'package:munch_yum/utils/constants/image_strings.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../authentication/screens/login/widgets/logo_avatar.dart';
import '../../controllers/cart_controller.dart';
import '../../models/cart_item_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key,});


  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: MSizes.md, right: MSizes.md, top: MSizes.xs, bottom: MSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cart',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              TextButton(
                onPressed: () => Get.to(() => OrdersScreen()),
                  child: Text(
                  'Order history', style: Theme.of(context).textTheme.labelSmall!.apply(
                color: MColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: MColors.primary,))
              ),
                ],
              ),
              Expanded(
                child: Obx(
                  () {
                    final suggestedItems = MenuItemController.instance.menuItems
                        .where((item) => controller.cartItem.every((cartItem) => cartItem.itemId != item.id))
                        .toList();

                    if (controller.cartItem.isEmpty) {
                      return Center(
                        child:Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MLogoAvatar(showBorder: false, child: Icon(Iconsax.reserve,color: MColors.primary, size: 40,), ),
                            const SizedBox(height: 8),
                            Text('You don\'t have any meal in your cart yet.', style: Theme.of(context).textTheme.bodySmall),
                            const SizedBox(height: 5),
                            Text('Order a meal to get started', style: Theme.of(context).textTheme.bodySmall,),
                            const SizedBox(height: 5),
                            TextButton(
                              onPressed: () => NavigationController.instance.selectedIndex.value = 0,
                              child: Text(
                                'Order a meal',
                                style: Theme.of(context).textTheme.labelSmall!.apply(
                                  color: MColors.primary,
                                  decoration: TextDecoration.underline,
                                  decorationColor: MColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Meal in your cart are here. Check out to have them delivered to you'),
                          SizedBox(height: MSizes.sm),
                          ListView.separated(
                              separatorBuilder: (context, index) => const SizedBox(height: MSizes.md),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.cartItem.length,
                              itemBuilder: (context, index) =>  MCartItemCard(cartItem: controller.cartItem[index],),
                            ),
                          const SizedBox(height: MSizes.md),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total Amount', style: Theme.of(context).textTheme.bodySmall,),
                                Text('₦${controller.totalCartPrice.value.toStringAsFixed(2)}', style: Theme.of(context).textTheme.headlineSmall,)
                              ],
                            ),
                          ),
                          Divider(),
                          const SizedBox(height: MSizes.spaceBtwItems),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Add more to the crunch...'),
                              SizedBox(height: MSizes.spaceBtwSections),
                              ListView.separated(
                                  separatorBuilder: (context, index) => const SizedBox(height: MSizes.md),
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: suggestedItems.length,
                                  itemBuilder: (context, index) => CartItemWithImage(menuItem: suggestedItems[index]),
                                ),

                            ],
                          )
                        ],
                      ),
                    );
                  }
                ),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(right: MSizes.md, left: MSizes.md, bottom: MSizes.md, top: MSizes.xs ),
        child: Obx(
          () {
            if (controller.cartItem.isEmpty) {
              return const SizedBox.shrink();
            }
            return  ElevatedButton(
              onPressed: () => Get.to(() => CheckoutScreen()),
              child:
              Text('Proceed to checkout'),
            );
          }
        ),
      ),
    );
  }
}
