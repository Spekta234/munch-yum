import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:munch_yum/features/shop/screens/orders/widgets/order_item_card.dart';
import 'package:munch_yum/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

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
                     onPressed: () => Get.back(),
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
                 child: SingleChildScrollView(
                   child: Column(
                     children: [
                       ListView.separated(
                         separatorBuilder: (context, index) => const SizedBox(height: MSizes.md),
                         shrinkWrap: true,
                         physics: const NeverScrollableScrollPhysics(),
                         itemCount: 2,
                         itemBuilder: (context, index) => const MOrderItemCard(),
                       )
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
