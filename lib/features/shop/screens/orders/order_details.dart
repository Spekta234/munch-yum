import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:munch_yum/common/menu/horizontal_menu_card.dart';
import 'package:munch_yum/features/shop/controllers/cart_controller.dart';
import 'package:munch_yum/features/shop/controllers/home_controller.dart';
import 'package:munch_yum/features/shop/models/order_model.dart';
import 'package:munch_yum/features/shop/screens/orders/widgets/item_details_row.dart';
import 'package:munch_yum/features/shop/screens/orders/widgets/oder_note_row.dart';
import 'package:munch_yum/features/shop/screens/orders/widgets/order_card_horizontal.dart';
import 'package:munch_yum/features/shop/screens/orders/widgets/order_details_screen.dart';
import 'package:munch_yum/utils/enums/enums.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/navigation_helpers.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final isPickup = order.orderMode == OrderMode.pickup;
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
                    onPressed: () => mBack(),
                    icon: Icon(Icons.arrow_back_ios_new),
                  ),
                  TextButton(
                      onPressed: () => CartController.instance.reorder(order.items),
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
                      Text(order.formattedDate, style: Theme.of(context).textTheme.labelMedium,),
                      const SizedBox(height: MSizes.spaceBtwItems),
                      ListView.separated(
                        itemCount: order.items.length,
                        separatorBuilder:(context, index) => SizedBox(height: 10),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => MOrderCardHorizontal(item: order.items[index],),
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

                          if (order.specialNote != null && order.specialNote!.isNotEmpty)
                          MOrderNoteRow(label: 'Note', value: order.specialNote!,),

                          if(order.orderingFor == OrderingFor.someoneElse) ...[
                            MOrderNoteRow(label: 'recipientName:', value: order.recipientName ?? '',),
                            MOrderNoteRow(label: 'recipientPhone:', value: order.recipientPhoneNo ?? '',),
                          ],
                          Text('Packaging type:', style: Theme.of(context).textTheme.labelSmall),
                          MOrderNoteRow(label: '${order.packagingType}: ', value: '₦${order.packagingFee}',),
                        ],
                      ),
                      const SizedBox(height: MSizes.spaceBtwItems * 2),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Order Details', style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500, color: Colors.black),),
                          const SizedBox(height: MSizes.spaceBtwItems),
                          MOrderDetailsRow(label: 'Order number', value: order.orderId,),
                          MOrderDetailsRow(label: 'Order from', value: HomeController.instance.user.value.selectedOutlet,),
                          MOrderDetailsRow(label: isPickup? 'Pick up' : 'Delivery', value: order.deliveryAddress),

                          if (order.scheduledDateTime != null)
                            MOrderDetailsRow(label: 'Scheduled for', value: order.formattedDeliveryDate),
                        ],
                      ),
                      const SizedBox(height: MSizes.spaceBtwSections),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Item Details', style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500, color: Colors.black),),
                          const SizedBox(height: MSizes.spaceBtwItems),
                          ...order.items.map((item) => MItemDetailsRow(
                              title: 'x${item.quantity} ${item.title}',
                              price: '₦${item.lineTotal.toStringAsFixed(0)}',
                          )),
                          // MItemDetailsRow(title: 'x2 Catfish Peppersoup', price: '₦6000',),
                          // MItemDetailsRow(title: 'x1 Phyllo Sandwich', price: '₦1,100',),
                          // MItemDetailsRow(title: 'x1 Meat Pie', price: '₦1,200',),
                          // MItemDetailsRow(title: 'x2 Turkey', price: '₦7,350',),
                          // MItemDetailsRow(title: 'x1 Sprite', price: '₦600',),
                          // MItemDetailsRow(title: 'x1 Ofada Rice (wrapped)', price: '₦2,500',),



                          MItemDetailsRow(title: 'Packaging', price: '₦${order.packagingFee.toStringAsFixed(0)}',),
                          MItemDetailsRow(title: isPickup ? 'Pick up' : 'Delivery', price: '₦${order.deliveryFee.toStringAsFixed(0)}',),
                          MItemDetailsRow(title: 'Service charge', price: '₦${order.serviceCharge.toStringAsFixed(0)}',),
                          if (order.discount > 0)
                            MItemDetailsRow(title: 'Discount', price: '-₦${order.discount.toStringAsFixed(0)}',),
                      const SizedBox(height: MSizes.spaceBtwSections),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total Amount', style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500, color: Colors.black),),
                          Text('₦${order.total.toStringAsFixed(0)}', style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600, color: Colors.black),)
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



