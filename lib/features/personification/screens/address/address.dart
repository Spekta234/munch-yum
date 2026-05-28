import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_yum/features/personification/screens/address/enter_address.dart';
import 'package:munch_yum/features/personification/screens/address/widgets/single_address.dart';
import 'package:munch_yum/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';

class Address extends StatelessWidget {
  const Address({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.only(top: MSizes.sm, right: MSizes.md, left: MSizes.md, bottom: MSizes.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: IconButton(
                        onPressed: ()  => Get.back(),
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        icon: Icon(Icons.arrow_back_ios_new, size: 24, color: Colors.black),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text('Address', style: Theme.of(context).textTheme.titleMedium,)
                  ],
                ),
                const SizedBox(height: MSizes.md),
                Text('We use your location to find the closest outlet to serve you.', style: Theme.of(context).textTheme.bodySmall,),
                const SizedBox(height: MSizes.spaceBtwItems),
                SingleAddress(selectedAddress: true),
                SingleAddress(selectedAddress: false),
                const SizedBox(height: MSizes.spaceBtwItems),
                Transform.translate(
                  offset: Offset(10, -10),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => Get.to(() => EnterAddress()),
                      child: Text(
                        'Add new address',
                        style: Theme.of(context).textTheme.labelSmall!.apply(
                          color: MColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor: MColors.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
