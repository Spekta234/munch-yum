import 'package:flutter/material.dart';
import 'package:munch_yum/features/shop/controllers/checkout_controller.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class MSpecialNoteField extends StatelessWidget {
  const MSpecialNoteField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: CheckoutController.instance.specialNote,
      maxLines: 5,
      decoration: InputDecoration(
          hintText: 'Special instructions or delivery notes',
          hintStyle: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding: EdgeInsets.all(MSizes.md),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: MColors.darkerGrey),
          )
      ),
    );
  }
}