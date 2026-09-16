import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_yum/features/personification/controllers/address_controller.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class EnterAddressTextformField extends StatelessWidget {
  const EnterAddressTextformField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final screenHeight = MediaQuery.of(context).size.height;
    return Form(
      key: controller.addressFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.deliveryLocation,
            validator:  (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter an address';
              }
              return null;
            },
            maxLines: 3,
            decoration: InputDecoration(
                hintText: 'Enter your address, city or landmark',
                hintStyle: Theme
                    .of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: Colors.grey),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)),
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
          ),
          SizedBox(height: screenHeight * 0.27),
          Obx(
            () => SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(disabledBackgroundColor: MColors.primary),
                onPressed:controller.isLoading.value
                    ? null
                    : () {
                  if (controller.addressFormKey.currentState!.validate()) {
                    controller.addNewAddress(controller.deliveryLocation.text.trim());
                  }
                },
                child: controller.isLoading.value
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),)
                    : Text('Set address'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}