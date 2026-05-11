import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:munch_yum/utils/constants/colors.dart';
import 'package:munch_yum/utils/constants/sizes.dart';

import '../../../../common/menu/cart_item_card.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Text('Checkout', style: Theme.of(context).textTheme.bodyLarge,),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Who are you ordering for?'),
                              Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  shape: BoxShape.rectangle,
                                  color: Colors.red.shade100,
                                ),
                                child: Text('Required',style: Theme.of(context).textTheme.labelSmall!.apply(color: MColors.primary),),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(value: true, onChanged: null,),
                              Text('Myself')
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(value: false, onChanged: null,),
                              Text('Someone else')
                            ],
                          ),
                        ],
                      ),
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
