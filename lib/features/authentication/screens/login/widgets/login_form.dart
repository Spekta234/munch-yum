import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/common/custom_shapes/checkbox/custom_checkbox.dart';
import 'package:munch_yum/common/form_divider.dart';
import 'package:munch_yum/features/authentication/controllers/login/login_controller.dart';
import 'package:munch_yum/features/authentication/screens/confirm_phoneno/confirm_phone_no.dart';
import 'package:munch_yum/features/authentication/screens/signup/sign_up.dart';
import 'package:munch_yum/features/shop/screens/home/home_screen.dart';
import 'package:munch_yum/navigation_menu.dart';
import 'package:munch_yum/utils/constants/colors.dart';

import '../../../../../utils/constants/image_strings.dart';


class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context){
    final controller = Get.put(LoginController());
    final screenHeight = MediaQuery.of(context).size.height;
    return Form(
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Email Address'),
          const SizedBox(height: 6),
          TextFormField(
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

          /// Phone no input
          Text('Password'),
          const SizedBox(height: 6),
          Obx(
            () => TextFormField(
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


          // Row(
          //   children: [
          //     Container(
          //       padding: const EdgeInsets.all(12),
          //       decoration: BoxDecoration(
          //         border: Border.all(color: Colors.grey),
          //         borderRadius: BorderRadius.circular(12),
          //       ),
          //       child: Row(
          //         children: [
          //           Text('+234'),
          //           const SizedBox(width: 6),
          //
          //           const Image(image: AssetImage(MImages.ngFlag), width: 24),
          //         ],
          //       ),
          //     ),
          //     const SizedBox(width: 8),
          //     Expanded(
          //       child: TextFormField(
          //         keyboardType: TextInputType.phone,
          //         decoration: InputDecoration(
          //           hintText: 'Your phone number',
          //           hintStyle: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.grey),
          //           isDense: true,
          //           contentPadding: EdgeInsets.all(18),
          //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          //           enabledBorder: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(12),
          //             borderSide: BorderSide(color: Colors.grey),
          //           ),
          //           focusedBorder: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(12),
          //             borderSide: BorderSide(color: Colors.black),
          //           ),
          //           focusedErrorBorder: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(12),
          //             borderSide: BorderSide(color: Colors.red),
          //           ),
          //           errorBorder: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(12),
          //             borderSide: BorderSide(color: Colors.red),
          //           ),
          //         ),
          //         validator: (value) {
          //           if (value == null || value.isEmpty) {
          //             return 'Please enter your phone number';
          //           }
          //           if (value.length < 10) {
          //             return 'Enter a valid phone number';
          //           }
          //           return null;
          //         },
          //       ),
          //     ),
          //   ],
          // ),

          /// Remember me and forgot password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Remember me
              Row(
                children: [
                  Obx(
                    () => Checkbox(value: controller.rememberMe.value,
                        onChanged: (value) =>
                        controller.rememberMe.value =
                        !controller.rememberMe.value),
                  ),
                  const Text('Remember me'),
                ],
              ),

              /// Forget password
              TextButton(
                onPressed: () {},
                child: Text('Forgot password?', style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: MColors.primary,
                ),),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.05),

          /// Divider
          MFormDivider(dividerText: 'OR'),
          SizedBox(height: screenHeight * 0.05),

          /// Sign up?
          Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Don\'t have an account? ',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w500,color: Colors.black),
                children: [
                  TextSpan(
                    text: 'Sign up',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: MColors.primary,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: MColors.primary,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () => Get.to(() => SignUpScreen()),
                  ),
                ],
              ),
            ),
          ),


          /// Continue bottom
          SizedBox(height: screenHeight * 0.07),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const NavigationMenu()),
              child: Text('Sign in'),
            ),
          ),
          const SizedBox(height: 10),

          /// Terms and conditions
          // Center(
          //   child: RichText(
          //     textAlign: TextAlign.center,
          //     text: TextSpan(
          //       text: 'By continuing, you agree to our ',
          //       style: Theme.of(context).textTheme.labelSmall!.apply(color: Colors.grey),
          //       children: [
          //         TextSpan(
          //           text: 'Terms & Conditions',
          //           style: Theme.of(context).textTheme.labelSmall!.copyWith(
          //             color: Colors.black,
          //             fontWeight: FontWeight.w600,
          //           ),
          //           recognizer: TapGestureRecognizer()..onTap = () {},
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 24),
        ],
      ),



    );
  }
}