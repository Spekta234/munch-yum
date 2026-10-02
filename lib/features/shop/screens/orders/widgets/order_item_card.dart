import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/common/texts/menu_price_text.dart';
import 'package:munch_yum/common/texts/menu_title_text.dart';
import 'package:munch_yum/features/personification/screens/support/support.dart';
import 'package:munch_yum/features/shop/controllers/cart_controller.dart';
import 'package:munch_yum/features/shop/models/order_model.dart';
import 'package:munch_yum/features/shop/screens/checkout/widgets/required_badge.dart';

import '../../../../../common/images/m_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/enums/enums.dart';
import '../../../controllers/order_controller.dart';
import '../order_details.dart';
import 'address_date_row.dart';
import 'order_status_badge.dart';

class MOrderItemCard extends StatelessWidget {
  const MOrderItemCard({super.key, required this.order});

  final OrderModel order;

  String get statusLabel {
    switch (order.paymentStatus) {
      case PaymentStatus.pending:
        return  'Payment Pending';
      case PaymentStatus.failed :
        return 'Payment Failed';
      case PaymentStatus.successful :
        return 'Payment Successful';
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = OrderController.instance;

    return GestureDetector(
      onTap: () => Get.to(() => OrderDetails(order: order,)),
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            /// image
            SizedBox(
              height: 140,
              width: 130,
              child: MRoundedImage(
                isNetworkImage: true,
                imageUrl: order.items.first.image!,
                margin: EdgeInsets.only(right: 2),
                fit: BoxFit.cover,
                applyImageRadius: false,
              ),
            ),

            /// content
            Expanded(
              child: Padding(padding: EdgeInsets.only(
                right: MSizes.sm,
                left: MSizes.sm,
                top: MSizes.xs,
                bottom: MSizes.xs,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: MMenuTitleText(title: order.items.first.title , smallSize: true,)),
                      MOrderStatusBadge(status: statusLabel,)
                    ],
                  ),
                  const SizedBox(height: MSizes.xs),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MMenuPriceText(price: order.total.toStringAsFixed(0)),
                      Text('${order.items.length} items', style: Theme.of(context).textTheme.labelSmall,)
                    ],
                  ),
                  SizedBox(height: MSizes.spaceBtwItems,),
                  MAddressDateRow(address: order.deliveryAddress, date: order.formattedDate,),
                  SizedBox(height: MSizes.sm,),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 35,
                          child: OutlinedButton.icon(
                            onPressed: () => Get.to(() => SupportScreen(showBackButton: true)),
                            icon: Icon(Iconsax.messages, size: 16),
                            label: Text('Get Help'),
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              side: BorderSide(color: Colors.grey.shade300),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: SizedBox(
                          height: 35,
                          child: ElevatedButton.icon(
                            onPressed: () => CartController.instance.reorder(order.items),
                            icon: Icon(Iconsax.shopping_cart, size: 16),
                            label: Text('Reorder'),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              side: BorderSide.none,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
              ),
            )
          ],
        ),
      ),
    );
  }
}


