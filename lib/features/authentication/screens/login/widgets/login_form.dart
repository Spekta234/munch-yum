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

          /// Passworf input
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

        ],
      ),



    );
  }
}