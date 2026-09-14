import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/features/authentication/screens/login/widgets/logo_avatar.dart';
import 'package:munch_yum/features/personification/controllers/address_controller.dart';
import 'package:munch_yum/features/personification/screens/address/enter_address.dart';
import 'package:munch_yum/features/personification/screens/address/widgets/single_address.dart';
import 'package:munch_yum/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';

class Address extends StatelessWidget {
  const Address({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      body: SafeArea(
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
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
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
             Expanded(child: SingleChildScrollView(
               child: Column(
                 children: [
                   FutureBuilder(
                     future: controller.fetchAddresses(),
                     builder:  (context, snapshot) {
                       if (snapshot.connectionState == ConnectionState.waiting) {
                         return const Center(
                           child:  CircularProgressIndicator(color: MColors.primary,),
                         );
                       }
                       if (snapshot.hasError) {
                         return const Center(
                           child:  Text('Something went wrong'),
                         );
                       }

                       if (controller.addresses.isEmpty) {
                         return Center(
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               MLogoAvatar(child: Icon(Iconsax.location5, color: MColors.primary, size: 38,), ),
                               const SizedBox(height: 5),
                               Text('No address', style: Theme.of(context).textTheme.bodyLarge!.apply(color: MColors.primary)),
                               const SizedBox(height: 5),
                               Text('You have not added a location yet', style: Theme.of(context).textTheme.bodySmall,),
                               const SizedBox(height: 5),
                               TextButton(
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
                             ],
                           ),
                         );
                       }

                       return  Obx(
                         () => ListView.builder(
                           shrinkWrap: true,
                           itemCount: controller.addresses.length,
                           itemBuilder: (_, index) {
                             final address = controller.addresses[index];

                             return SingleAddress(
                               address: address,
                               onTap: () => controller.selectedAddress(address),
                             );
                           }
                         ),
                       );
                     },
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
