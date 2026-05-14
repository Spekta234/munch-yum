import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_yum/common/menu/cart_item_card.dart';
import 'package:munch_yum/features/authentication/screens/login/widgets/heading_text.dart';
import 'package:munch_yum/features/shop/screens/cart/widgets/cart_item_with_image.dart';
import 'package:munch_yum/features/shop/screens/checkout/checkout_screen.dart';
import 'package:munch_yum/features/shop/screens/orders/orders_screen.dart';
import 'package:munch_yum/utils/constants/image_strings.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: MSizes.md, right: MSizes.md, top: MSizes.xs, bottom: MSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            /// header
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Meal in your cart are here. Check out to have them delivered to you'),
                      SizedBox(height: MSizes.sm),
                      ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(height: MSizes.md),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (context, index) => const MCartItemCard(),
                      ),
                      const SizedBox(height: MSizes.md),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Amount', style: Theme.of(context).textTheme.bodySmall,),
                            Text('₦8,000.00', style: Theme.of(context).textTheme.headlineSmall,)
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
                            itemCount: 4,
                            itemBuilder: (context, index) => const CartItemWithImage(),
                          ),

                        ],
                      )
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(right: MSizes.md, left: MSizes.md, bottom: MSizes.md, top: MSizes.xs ),
        child: ElevatedButton(
          onPressed: () => Get.to(() => CheckoutScreen()),
          child:
          Text('Proceed to checkout'),
        ),
      ),
    );
  }
}
