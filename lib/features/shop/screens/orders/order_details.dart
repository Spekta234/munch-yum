import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:munch_yum/common/menu/horizontal_menu_card.dart';
import 'package:munch_yum/features/shop/screens/orders/widgets/item_details_row.dart';
import 'package:munch_yum/features/shop/screens/orders/widgets/oder_note_row.dart';
import 'package:munch_yum/features/shop/screens/orders/widgets/order_card_horizontal.dart';
import 'package:munch_yum/features/shop/screens/orders/widgets/order_details_screen.dart';

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
                        itemBuilder: (context, index) => MOrderCardHorizontal(),
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

                          MOrderNoteRow(label: 'Note', value: ',',),
                          MOrderNoteRow(label: 'recipientName:', value: ',',),
                          MOrderNoteRow(label: 'recipientPhone:', value: ',',),
                          MOrderNoteRow(label: 'packaging type:', value: '',),
                          MOrderNoteRow(label: 'Branded nylon:', value: 'N0.0',),
                        ],
                      ),
                      const SizedBox(height: MSizes.spaceBtwItems * 2),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Order Details', style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500, color: Colors.black),),
                          const SizedBox(height: MSizes.spaceBtwItems),
                          MOrderDetailsRow(label: 'Order number', value: 'MOB-ENG3-PK-20260501-96',),
                          MOrderDetailsRow(label: 'Order from', value: '18, Charles street, beside shoprite, GRA enugu',),
                          MOrderDetailsRow(label: 'Delivery', value: '18, Charles street, beside shoprite, GRA enugu',),
                        ],
                      ),
                      const SizedBox(height: MSizes.spaceBtwSections),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Item Details', style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500, color: Colors.black),),
                          const SizedBox(height: MSizes.spaceBtwItems),
                          MItemDetailsRow(title: 'x2 Catfish Peppersoup', price: '₦6000',),
                          MItemDetailsRow(title: 'x1 Phyllo Sandwich', price: '₦1,100',),
                          MItemDetailsRow(title: 'x1 Meat Pie', price: '₦1,200',),
                          MItemDetailsRow(title: 'x2 Turkey', price: '₦7,350',),
                          MItemDetailsRow(title: 'x1 Sprite', price: '₦600',),
                          MItemDetailsRow(title: 'x1 Ofada Rice (wrapped)', price: '₦2,500',),
                          MItemDetailsRow(title: 'Pick up', price: '₦0',),
                          MItemDetailsRow(title: 'Service charge', price: '₦450',),
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
                ],
                  ),
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



