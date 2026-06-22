import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/features/authentication/screens/confirm_phoneno/confirm_phone_no.dart';
import 'package:munch_yum/features/authentication/screens/signup/verify_email.dart';
import 'package:munch_yum/utils/constants/sizes.dart';
import 'package:munch_yum/utils/validators/validation.dart';

import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../controllers/signup/signup_controller.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final screenHeight = MediaQuery.of(context).size.height;
    return Form(
      key: controller.signupFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Full Name'),
          const SizedBox(height: 6),
          TextFormField(
            controller: controller.fullName,
            validator: (value) => MValidator.validateEmptyText('Full Name', value),
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.user),
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
          Text('Email Address'),
          const SizedBox(height: 6),
          TextFormField(
            controller: controller.email,
            validator: (value) => MValidator.validateEmail(value),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.mail_outlined),
              hintText: 'Enter your email',
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
          Text('Phone number'),
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  controller: controller.phone,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone_sharp),
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
                  validator: (value) => MValidator.validatePhoneNumber(value),
              ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.02),
          Text('Password'),
          const SizedBox(height: 6),
          Obx(
                () => TextFormField(
                  controller: controller.password,
                  validator: (value) => MValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                hintText: 'Enter your password',
                hintStyle: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.grey),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                    onPressed: () =>
                    controller.hidePassword.value = !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye)
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
            ),
          ),
          SizedBox(height: screenHeight * 0.05),

          /// Sign up button
          Obx(
            () =>  SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.isLoading.value? null : controller.signup(),
                child: controller.isLoading.value
                    ? const CircularProgressIndicator(color: Colors.white,)
                    : Text('Sign up'),
              ),
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
