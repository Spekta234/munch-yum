import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/features/shop/controllers/checkout_controller.dart';
import 'package:munch_yum/features/shop/screens/checkout/widgets/checkbox_row.dart';
import 'package:munch_yum/features/shop/screens/checkout/widgets/coupon_code.dart';
import 'package:munch_yum/features/shop/screens/checkout/widgets/delivery_bottomsheet.dart';
import 'package:munch_yum/features/shop/screens/checkout/widgets/required_badge.dart';
import 'package:munch_yum/features/shop/screens/checkout/widgets/special_note_field.dart';
import 'package:munch_yum/features/shop/screens/checkout/widgets/summary_row.dart';
import 'package:munch_yum/utils/constants/colors.dart';
import 'package:munch_yum/utils/constants/sizes.dart';

import '../../../../common/menu/cart_item_card.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    return Scaffold(
      body: SafeArea(
        child: Padding(padding: EdgeInsets.all(MSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                    width: 20,
                    child: IconButton(
                      onPressed: () => Get.back(),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      icon: Icon(Icons.arrow_back_ios_new, size: 24, color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: MSizes.md),
                  Text('Checkout', style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600
                  ),),
                  const SizedBox(height: MSizes.xs),
                  Text('Check out to have them delivered to you.', style: Theme.of(context).textTheme.labelSmall,)
                ],
              ),
              const SizedBox(height: MSizes.spaceBtwItems),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(height: MSizes.md),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (context, index) => const MCartItemCard(),
                      ),
                      const SizedBox(height: MSizes.spaceBtwItems),
                      Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            /// Who are you ordering for
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Who are you ordering for?', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500)),
                                RequiredBadge(),
                              ],
                            ),
                            const SizedBox(height: MSizes.xs,),
                            MCheckboxRow(
                              title: 'Myself',
                              price: '',
                              isSelected: controller.orderingFor.value == 'Myself',
                              onTap: () => controller.orderingFor.value = 'Myself',
                            ),
                            const SizedBox(height: MSizes.xs,),
                            MCheckboxRow(
                              title: 'Someone else',
                              price: '',
                              isSelected: controller.orderingFor.value == 'Someone else',
                              onTap: () => controller.orderingFor.value = 'Someone else',
                            ),
                            if (controller.orderingFor.value == 'Someone else')
                              /// Text fields for recipient
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 8),
                                  Text('Recipient Name', style: Theme.of(context).textTheme.bodyLarge!.apply(color: MColors.darkerGrey),),
                                  SizedBox(height: 8),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Enter recipient name',
                                      hintStyle: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.grey),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(color: Colors.grey),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Text('Enter phone number', style: Theme.of(context).textTheme.bodyLarge!.apply(color: MColors.darkerGrey),),
                                  SizedBox(height: 8),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      hintText: 'Enter phone number',
                                      hintStyle: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.grey),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(color: Colors.grey),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            const SizedBox(height: MSizes.spaceBtwItems),

                            /// Packaging type
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Packaging type', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500)),
                                RequiredBadge(),
                              ],
                            ),
                            const SizedBox(height: MSizes.sm,),
                            MCheckboxRow(
                              title: 'Branded nylon',
                              price: 'Free',
                              isSelected: controller.packagingType.value == 'Branded nylon',
                              onTap: () => controller.packagingType.value = 'Branded nylon',
                            ),
                            MCheckboxRow(
                              title: 'Paper bag',
                              price: '₦500.0',
                              isSelected: controller.packagingType.value == 'Paper bag',
                              onTap: () => controller.packagingType.value = 'Paper bag',
                            ),
                            MCheckboxRow(
                              title: 'Love box (ideal for gift)',
                              price: '₦500.0',
                              isSelected: controller.packagingType.value == 'Love box (ideal for gift)',
                              onTap: () => controller.packagingType.value = 'Love box (ideal for gift)',
                            ),
                            const SizedBox(height: MSizes.spaceBtwItems),

                            /// Order mode
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Order mode', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500)),
                                RequiredBadge(),
                              ],
                            ),
                            const SizedBox(height: MSizes.sm,),
                            MCheckboxRow(
                              title: 'Delivery',
                              price: '₦2000.0',
                              isSelected: controller.orderMode.value == 'Delivery',
                              onTap: () {
                                controller.orderMode.value = 'Delivery';
                                // open bottomsheet
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                  ),
                                  builder: (context) => DeliveryBottomSheet(),
                                );
                              }
                            ),
                            const SizedBox(height: MSizes.sm,),
                            MCheckboxRow(
                              title: 'Pick up',
                              price: 'Free',
                              isSelected: controller.orderMode.value == 'Pick up',
                              onTap: () {
                                controller.orderMode.value = 'Pick up';
                                // open bottomsheet
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                  ),
                                  builder: (context) => DeliveryBottomSheet(isPickUp: true,),
                                );
                              }
                            ),
                            const SizedBox(height: MSizes.spaceBtwItems),

                            /// Special note
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Note', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500)),
                                const SizedBox(height: MSizes.sm),
                                MSpecialNoteField(),
                              ],
                            ),
                            const SizedBox(height: MSizes.spaceBtwItems),

                            /// Coupon code
                            MCouponCode(),
                            const SizedBox(height: MSizes.spaceBtwItems),

                            /// Summary and total
                            Column(
                              children: [
                                MSummaryRow(title: 'Total item', amount: '₦8000.00'),
                                MSummaryRow(title: 'Packaging', amount: '₦0.00'),
                                MSummaryRow(title: 'Delivery', amount: '₦2000.00'),
                                MSummaryRow(title: 'Service charge', amount: '₦222.00'),
                                Divider(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total Amount',
                                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                          fontWeight: FontWeight.w500
                                        ),
                                      ),
                                      Text(
                                        '₦10,222.00',
                                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(right: MSizes.md, left: MSizes.md, bottom: MSizes.lg, top: MSizes.xs ),
        child: ElevatedButton(
          onPressed: () => Get.to(() => CheckoutScreen()),
          child:
          Text('Checkout'),
        ),
      ),
    );
  }
}




