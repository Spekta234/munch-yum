import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/features/authentication/controllers/re-auth_controller.dart';
import 'package:munch_yum/features/authentication/controllers/signup/signup_controller.dart';
import 'package:munch_yum/utils/constants/colors.dart';
import 'package:munch_yum/utils/constants/sizes.dart';

import '../../../utils/validators/validation.dart';

class ReAuthBottomSheet extends StatelessWidget {
  const ReAuthBottomSheet ({super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;


  @override
  Widget build(BuildContext context) {
    final controller = ReAuthController.instance;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: MSizes.md,
          bottom: MSizes.md,
          left: MSizes.md,
          right: MSizes.md,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: MSizes.spaceBtwItems),
                  Text(
                    subTitle,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
            SizedBox(height: MSizes.spaceBtwSections),
            Obx(
                () => TextFormField(
                  controller: controller.password,
                  obscureText: controller.hidePassword.value,
                  onChanged: (value) => controller.hasPassword.value = value.isNotEmpty,
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
            const SizedBox(height: MSizes.spaceBtwSections),
            Obx(
              () {
                final enabled = controller.hasPassword.value && !controller.isLoading.value;
                
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      disabledBackgroundColor: MColors.primary,
                    ),
                    onPressed: enabled ? ()
                    async {
                      final reAuth = await controller.reAuthUser();
                      if (!context.mounted) return;
                      if (reAuth) Navigator.pop(context, true);
                    }  : null,
                    child: controller.isLoading.value ? const  SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),) : Text('Continue'),
                  ),
                );
              }
            ),
            const SizedBox(height: MSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
