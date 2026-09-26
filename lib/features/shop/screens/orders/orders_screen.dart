import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/features/shop/controllers/order_controller.dart';
import 'package:munch_yum/features/shop/screens/orders/widgets/order_item_card.dart';
import 'package:munch_yum/utils/constants/sizes.dart';

import '../../../../navigation_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/navigation_helpers.dart';
import '../../../authentication/screens/login/widgets/logo_avatar.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key,});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final controller = OrderController.instance;

  @override
  void initState() {
    super.initState();
    controller.fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(MSizes.sm),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Row(
                 children: [
                   IconButton(
                     onPressed: () => mBack(),
                     icon: Icon(Icons.arrow_back_ios_new),
                   ),
                   Text(
                     'Your Orders',
                     style: Theme.of(
                       context,
                     ).textTheme.bodySmall!.apply(color: Colors.black),
                   ),
                 ],
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: MSizes.sm),
                 child: Row(
                   children: [
                     Expanded(
                       child: Container(
                         padding: EdgeInsets.symmetric(horizontal: 16),
                         decoration: BoxDecoration(
                           color: MColors.lightGrey,
                           borderRadius: BorderRadius.circular(30),
                         ),
                         child: TextField(
                           decoration: InputDecoration(
                             contentPadding: EdgeInsets.symmetric(
                               vertical: 16,
                               horizontal: 16,
                             ),
                             hintText: 'Search Order',
                             helperStyle: Theme.of(context).textTheme.bodySmall,
                             prefixIcon: Icon(Icons.search, color: Colors.grey),
                             border: InputBorder.none,
                             enabledBorder: InputBorder.none,
                             focusedBorder: InputBorder.none,
                           ),
                         ),
                       ),
                     ),

                     const SizedBox(width: 10),
                     Container(
                       padding: EdgeInsets.all(12),
                       decoration: BoxDecoration(
                         color: Colors.transparent,
                         shape: BoxShape.circle,
                       ),
                       child: Icon(Icons.filter_list, color: Colors.black),
                     ),
                   ],
                 ),
               ),
               const SizedBox(height: MSizes.sm),
               Text('All Orders', style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500)),
               const SizedBox(height: MSizes.sm),
               Expanded(
                 child: Obx(
                   () {
                     if (controller.isFetching.value) {
                       return const Center(
                         child: CircularProgressIndicator(color: MColors.primary),
                       );
                     }

                     if (controller.orders.isEmpty) {
                       return Center(
                         child: Column(
                           mainAxisSize: MainAxisSize.min,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             MLogoAvatar(showBorder: false, child: Icon(Iconsax.clipboard, color: MColors.primary, size: 38,), ),
                             const SizedBox(height: 5),
                             Text('No Orders', style: Theme.of(context).textTheme.bodyLarge!.apply(color: MColors.primary)),
                             const SizedBox(height: 5),
                             Text('You haven\'t ordered anything yet', style: Theme.of(context).textTheme.bodySmall,),
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

                     return  SingleChildScrollView(
                       child: Column(
                         children: [
                           ListView.separated(
                             separatorBuilder: (context, index) => const SizedBox(height: MSizes.md),
                             shrinkWrap: true,
                             physics: const NeverScrollableScrollPhysics(),
                             itemCount: controller.orders.length,
                             itemBuilder: (context, index) =>  MOrderItemCard(order: controller.orders[index],),
                           )
                         ],
                       ),
                     );
                   }
                 ),
               )
             ],
           ),
        ),
      ),
    );
  }

}
