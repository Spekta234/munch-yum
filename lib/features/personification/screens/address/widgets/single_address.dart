import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/common/custom_shapes/containers/rounded_container.dart';
import 'package:munch_yum/utils/constants/colors.dart';
import 'package:munch_yum/utils/constants/sizes.dart';

import '../../../../../common/widgets/bottomsheets/bottomsheets.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    return MRoundedContainer(
      padding: EdgeInsets.all(MSizes.md),
     showBorder: true,
     width: double.infinity,
     backgroundColor: selectedAddress ? MColors.primary.withOpacity(0.1) : Colors.transparent,
     borderColor: selectedAddress ? MColors.primary : MColors.grey,
     margin: const EdgeInsets.only(bottom: MSizes.spaceBtwItems),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selectedAddress ? MColors.primary : MColors.lightGrey,
            ),
            child: Icon(Iconsax.location5, color: selectedAddress ? Colors.white : MColors.darkerGrey,),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              'No.5 Charles Street GRA Enugu',
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
                  color: selectedAddress ? MColors.primary : Colors.transparent,
                  border: Border.all(
                    color: selectedAddress ? MColors.primary : Colors.grey,
                    width: 1.5,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  selectedAddress ? Icons.check : null,
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
                          subtitle2: 'from\n your address. Are you sure you want to remove from\n address?',
                          onCancelTap: () {},
                          onRemoveTap: () {}, child: Text(''),
                        ),
                  );
                },
                icon: Icon(Iconsax.trash, color: MColors.primary,),
              )
            ],
          )
        ],
      ),
    );
  }
}
