import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:munch_yum/common/menu/horizontal_menu_card.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(padding: EdgeInsets.only(right: MSizes.md, left: MSizes.md, top: MSizes.sm, bottom: MSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.arrow_back_ios_new),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                          'Reorder', style: Theme.of(context).textTheme.labelSmall!.apply(
                        color: MColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: MColors.primary,))
                  ),
                ],
              ),
              const SizedBox(height: MSizes.xs),
              Text('Order details', style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),),
              const SizedBox(height: MSizes.sm),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('1, May 2026', style: Theme.of(context).textTheme.labelMedium,),
                      const SizedBox(height: MSizes.spaceBtwItems),
                      ListView.separated(
                        itemCount: 5,
                        separatorBuilder:(context, index) => SizedBox(height: 10),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => MMenuCardHorizontal(isQty: true,),
                      ),
                      const SizedBox(height: MSizes.spaceBtwItems),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Note',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          const SizedBox(height: MSizes.sm),

                          // Layout using Text.rich for inline styling/variables
                          Text.rich(
                            TextSpan(
                              style: TextStyle(fontSize: 16, height: 1.5), // Applies to the whole line
                              children: [
                                TextSpan(text: 'Note: ', style: Theme.of(context).textTheme.labelSmall),
                                TextSpan(text: ',',  style: Theme.of(context).textTheme.labelSmall),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(fontSize: 16, height: 1.5),
                              children: [
                                TextSpan(text: 'recipientName: ', style: Theme.of(context).textTheme.labelSmall),
                                TextSpan(text: ',',  style: Theme.of(context).textTheme.labelSmall),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(fontSize: 16, height: 1.5),
                              children: [
                                TextSpan(text: 'recipientPhone: ', style: Theme.of(context).textTheme.labelSmall),
                                TextSpan(text: ',',  style: Theme.of(context).textTheme.labelSmall),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(fontSize: 16, height: 1.5),
                              children: [
                                TextSpan(text: 'Packaging type: ', style: Theme.of(context).textTheme.labelSmall),
                                TextSpan(text: ' ', style: Theme.of(context).textTheme.labelSmall),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(fontSize: 16, height: 1.5),
                              children: [
                                TextSpan(text: 'Branded nylon: ', style: Theme.of(context).textTheme.labelSmall),
                                TextSpan(text: 'N0.0', style: Theme.of(context).textTheme.labelSmall),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: MSizes.spaceBtwItems * 2),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Order Details', style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500, color: Colors.black),),
                          const SizedBox(height: MSizes.spaceBtwItems),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text('Order number', style: Theme.of(context).textTheme.labelSmall,),
                             SizedBox(width: MSizes.spaceBtwSections * 2,),
                             Flexible(child: Text('MOB-ENG3-PK-20260501-96', overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500, color: Colors.black),))
                           ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text('Order from', style: Theme.of(context).textTheme.labelSmall,),
                             SizedBox(width: MSizes.spaceBtwSections * 2,),
                             Flexible(child: Text('18, Charles street, beside shoprite, GRA enugu', overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500, color: Colors.black),))
                           ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text('Delivery', style: Theme.of(context).textTheme.labelSmall,),
                             SizedBox(width: MSizes.spaceBtwSections * 2,),
                             Flexible(child: Text('18, Charles street, beside shoprite, GRA enugu', overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500, color: Colors.black),))
                           ],
                          ),
                        ],
                      ),
                      const SizedBox(height: MSizes.spaceBtwSections),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Item Details', style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500, color: Colors.black),),
                          const SizedBox(height: MSizes.spaceBtwItems),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('x 2 Parfait',  style: Theme.of(context).textTheme.labelSmall),
                              Text('₦5,400',  style: Theme.of(context).textTheme.labelLarge),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('x1 Phyllo Sandwich',  style: Theme.of(context).textTheme.labelSmall),
                              Text('₦1,100',  style: Theme.of(context).textTheme.labelLarge),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('x1 Meat Pie',  style: Theme.of(context).textTheme.labelSmall),
                              Text('₦1,200',  style: Theme.of(context).textTheme.labelLarge),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('x2 Turkey',  style: Theme.of(context).textTheme.labelSmall),
                              Text('₦7,350', style: Theme.of(context).textTheme.labelLarge),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('x1 Sprite 60cl',  style: Theme.of(context).textTheme.labelSmall),
                              Text('₦600',  style: Theme.of(context).textTheme.labelLarge),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('x1 Ofada Rice (wrapped)',  style: Theme.of(context).textTheme.labelSmall),
                              Text('₦2,500',  style: Theme.of(context).textTheme.labelLarge),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Pick up',  style: Theme.of(context).textTheme.labelSmall),
                              Text('₦0',  style: Theme.of(context).textTheme.labelLarge),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Service charge',  style: Theme.of(context).textTheme.labelSmall),
                              Text('₦450',  style: Theme.of(context).textTheme.labelLarge),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: MSizes.spaceBtwSections),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total Amount', style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500, color: Colors.black),),
                          Text('18,600', style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600, color: Colors.black),)
                        ],
                      ),
                      const SizedBox(height: MSizes.spaceBtwSections),

                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
