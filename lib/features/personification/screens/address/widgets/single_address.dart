import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/common/custom_shapes/containers/rounded_container.dart';
import 'package:munch_yum/features/personification/controllers/address_controller.dart';
import 'package:munch_yum/features/personification/models/address_model.dart';
import 'package:munch_yum/utils/constants/colors.dart';
import 'package:munch_yum/utils/constants/sizes.dart';

import '../../../../../common/widgets/bottomsheets/bottomsheets.dart';
import '../../../../../utils/snackbar/snack_bar.dart';
import '../enter_address.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.address, required this.onTap,});

  final AddressModel address;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Obx(
      () {
        final isSelected = controller.selectedAddress.value?.id == address.id;

        return GestureDetector(
          onTap: onTap,
          child: MRoundedContainer(
            padding: EdgeInsets.all(MSizes.md),
            showBorder: true,
            width: double.infinity,
            backgroundColor: isSelected ? MColors.primary.withOpacity(0.1) : Colors.transparent,
            borderColor: isSelected ? MColors.primary : MColors.grey,
            margin: const EdgeInsets.only(bottom: MSizes.spaceBtwItems),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? MColors.primary : MColors.lightGrey,
                  ),
                  child: Icon(Iconsax.location5, color: isSelected ? Colors.white : MColors.darkerGrey,),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    address.address,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: isSelected ? MColors.primary : Colors.transparent,
                        border: Border.all(
                          color: isSelected ? MColors.primary : Colors.grey,
                          width: 1.5,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isSelected ? Icons.check : null,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          showDragHandle: false,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          builder: (context) =>
                              MBottomSheet(
                                title: 'Remove Address',
                                icon: Iconsax.location5,
                                subtitle1: 'You are about to remove this location',
                                subtitle2: ' from\n your address. Are you sure you want to remove from\n address?',
                                onCancelTap: () => Navigator.pop(context),
                                onRemoveTap: () {
                                   controller.deleteAddress(address.id);
                                   Navigator.pop(context);
                                },
                                removeText: 'Remove Address',
                                child: Text(address.address),
                              ),
                        );
                      },
                      icon: Icon(Iconsax.trash, color: MColors.primary,),
                    ),

                    const SizedBox(height: MSizes.spaceBtwItems),
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
