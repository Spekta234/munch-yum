import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_yum/features/authentication/screens/confirm_phoneno/confirm_phone_no.dart';

import '../../../../../utils/constants/image_strings.dart';


class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Form(
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your full name'),
          const SizedBox(height: 6),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter your full name',
              hintStyle: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.grey),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
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
          ),
          SizedBox(height: screenHeight * 0.02),

          /// Phone no input
          Text('Phone Number'),
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
                    const SizedBox(width: 6),

                    const Image(image: AssetImage(MImages.ngFlag), width: 24),
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

          /// Continue bottom
          SizedBox(height: screenHeight * 0.27),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const ConfirmPhoneNoScreen()),
              child: Text('Continue'),
            ),
          ),
          const SizedBox(height: 10),

          /// Terms and conditions
          Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'By continuing, you agree to our ',
                style: Theme.of(context).textTheme.labelSmall!.apply(color: Colors.grey),
                children: [
                  TextSpan(
                    text: 'Terms & Conditions',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),



    );
  }
}