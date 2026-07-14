import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:munch_yum/features/personification/controllers/loyalty_controller.dart';
import 'package:munch_yum/utils/constants/sizes.dart';

import '../../../../../common/custom_shapes/bottom_sheets/dob_bottomsheet.dart';
import '../../../../../common/custom_shapes/checkbox/custom_checkbox.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/validators/validation.dart';

class LoyaltyRegistrationForm extends StatelessWidget {
  const LoyaltyRegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoyaltyController.instance;
    return Form(
      key: controller.loyaltyFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('First Name'),
          const SizedBox(height: 6),
          TextFormField(
            controller: controller.firstName,
            validator: (value) => MValidator.validateEmptyText('First name', value),
            decoration: InputDecoration(
              hintText: 'Enter your first name',
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
          SizedBox(height: MSizes.spaceBtwItems),
          Text('Last name'),
          const SizedBox(height: 6),
          TextFormField(
            controller: controller.lastName,
            validator: (value) => MValidator.validateEmptyText('Last name', value),
            decoration: InputDecoration(
              hintText: 'Enter your last name',
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
          SizedBox(height: MSizes.spaceBtwItems),
          Text('Gender'),
          const SizedBox(height: 6),
          DropdownButtonFormField<String>(
            key: UniqueKey(),
            value: null,
            icon: Icon(Icons.keyboard_arrow_down_outlined, color: Colors.black,),
            decoration: InputDecoration(
              hintText: 'Select a Gender',
              hintStyle: Theme.of(context).textTheme.labelSmall!.apply(color: Colors.grey),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(28)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            items: ['Male', 'Female', 'Prefer not to say',]
                .map((gender) => DropdownMenuItem(
              value: gender,
              child: Text(gender),
            )).toList(),
            onChanged: (value) => controller.selectedGender.value = value ?? '',

          ),
          SizedBox(height: MSizes.spaceBtwItems),
          Text('Date of birth'),
          const SizedBox(height: 6),
          Obx(() => TextFormField(
            readOnly: true,
            onTap: () {
              showModalBottomSheet(
                showDragHandle: false,
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) => const DOBBottomSheet(),
              );
            },
            controller: TextEditingController(
              text: controller.dob.value,
            ),
            decoration: InputDecoration(
              hintText: 'DD/MM',
              hintStyle: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.grey),
              suffixIcon: Icon(Icons.calendar_month_outlined, color: Colors.black,),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          )),
          SizedBox(height: MSizes.spaceBtwItems),
          Text('Email (Optional)'),
          const SizedBox(height: 6),
          TextFormField(
            controller: controller.email,
            decoration: InputDecoration(
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
          SizedBox(height: MSizes.spaceBtwItems),
          Text('Outlet code (Optional)'),
          const SizedBox(height: 6),
          TextFormField(
            controller: controller.outletCode,
            decoration: InputDecoration(
              hintText: 'Enter outlet code',
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
          SizedBox(height: MSizes.spaceBtwSections),
          Obx(() => Row(
            children: [
              MCustomCheckbox(
                isSelected: controller.hasAgreed.value,
                onTap: () => controller.hasAgreed.value = !controller.hasAgreed.value,
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'I have read ',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      TextSpan(
                        text: 'Terms & Conditions ',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                        ),
                      ),
                      TextSpan(
                        text: 'before activating',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
          SizedBox(height: MSizes.spaceBtwSections),
          // Obx(() => SizedBox(
          //   width: double.infinity,
          //   child: ElevatedButton(
          //     onPressed: controller.hasAgreed.value ? () {} : null,
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: controller.hasAgreed.value
          //           ? MColors.primary
          //           : Colors.grey.shade300,
          //       disabledBackgroundColor: Colors.grey.shade300,
          //       disabledForegroundColor: Colors.grey,
          //       side: BorderSide.none,
          //     ),
          //     child: Text('Activate program'),
          //   ),
          // )),
          Obx(() => SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: controller.hasAgreed.value && !controller.isLoading.value
                  ? () => controller.activateLoyalty()
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: controller.hasAgreed.value
                    ? MColors.primary
                    : Colors.grey.shade300,
                disabledBackgroundColor: Colors.grey.shade300,
                disabledForegroundColor: Colors.grey,
                side: BorderSide.none,
              ),
              child: controller.isLoading.value
                  ? const CircularProgressIndicator(color: Colors.white)
                  : Text('Activate program'),
            ),
          )),

        ],
      ),
    );
  }
}
