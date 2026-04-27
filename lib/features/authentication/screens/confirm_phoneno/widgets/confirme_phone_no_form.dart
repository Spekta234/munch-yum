import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:munch_yum/features/authentication/screens/location/location.dart';
import 'package:munch_yum/features/authentication/screens/login/login.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../confirm_phone_no.dart';

class ConfirmPhoneNoForm extends StatelessWidget {
  const ConfirmPhoneNoForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // -- phoneNo input
          Text('Confirm Phone Number'),
          const SizedBox(height: 6),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Text('+234'),
                    SizedBox(width: 6),

                    Image(image: AssetImage(MImages.ngFlag), width: 24),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Your phone number',
                    hintStyle: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.grey),
                    isDense: true,
                    contentPadding: EdgeInsets.all(18),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (value.length < 10) {
                      return 'Enter a valid phone number';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),

          /// Don't forget to add the loader in this button after the logic
          // -- Continue Button --
          SizedBox(height: screenHeight * 0.17),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => LocationScreen()),
              child: Text('Continue'),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}