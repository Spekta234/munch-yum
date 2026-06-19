import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_yum/common/styles/spacing_styles.dart';
import 'package:munch_yum/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:munch_yum/utils/constants/sizes.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: MSpacingStyles.paddingWithAppBarHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(onPressed: () => Get.back(), icon: Icon(Icons.close)),
            ),
            const SizedBox(height: MSizes.spaceBtwSections),
            Text('Forgot password', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: MSizes.spaceBtwItems),
            Text('Enter your email below and we will send you a password reset link'),
            const SizedBox(height: MSizes.spaceBtwSections),
            Form(
              child: TextFormField(
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
            ),

            SizedBox(height: MSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => Get.to(() => ResetPassword()), child: Text('Submit')),
            ),
          ],
        ),
      ),
    );
  }
}
