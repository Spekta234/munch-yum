import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:munch_yum/features/personification/controllers/loyalty_controller.dart';
import 'package:munch_yum/features/personification/controllers/profile_controller.dart';
import 'package:munch_yum/utils/constants/colors.dart';
import 'package:munch_yum/utils/validators/validation.dart';

import '../../../../../common/custom_shapes/bottom_sheets/dob_bottomsheet.dart';
import '../../../../../utils/constants/sizes.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = ProfileController.instance;
    return Obx(
      () => Form(
        key: controller.profileFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('First Name'),
            const SizedBox(height: 6),
            TextFormField(
              controller: controller.firstName,
              readOnly: !controller.isEditing.value,
              validator: (value) => MValidator.validateEmptyText('First name' , value),
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
              readOnly: !controller.isEditing.value,
              validator: (value) => MValidator.validateEmptyText('Last name' , value),
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
            Text('Phone Number'),
            const SizedBox(height: 6),
            TextFormField(
              controller: controller.phoneNo,
              readOnly: !controller.isEditing.value,
              validator: (value) => MValidator.validatePhoneNumber(value),
              decoration: InputDecoration(
                hintText: 'Enter your phone number',
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
              key: ValueKey(controller.selectedGender.value),
              value: controller.selectedGender.value.isEmpty ? null : controller.selectedGender.value,
              disabledHint: Text(
                'Select a Gender',
                style: Theme.of(context).textTheme.labelSmall!.apply(color: Colors.grey),
              ),
              icon: Icon(Icons.keyboard_arrow_down_outlined, color: Colors.black,),
              decoration: InputDecoration(
                enabled: controller.canEditLoyaltyFields,
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
              onChanged: controller.canEditLoyaltyFields
                  ? (value) => controller.selectedGender.value = value!
                  : null,

            ),
            SizedBox(height: MSizes.spaceBtwItems),
            Text('Date of birth'),
            const SizedBox(height: 6),
            Obx(() => TextFormField(
              key: ValueKey(controller.dob.value),
              initialValue: controller.dob.value,
              readOnly: true,
              onTap: controller.canEditLoyaltyFields ? ()  {
                showModalBottomSheet(
                  showDragHandle: false,
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (context) => const DOBBottomSheet(isLoyalty: false,),
                );
              } : null,
              decoration: InputDecoration(
                enabled: controller.canEditLoyaltyFields,
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
            Text('Email'),
            const SizedBox(height: 6),
            TextFormField(
              readOnly: true,
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

            Obx(() => controller.isEditing.value
                ? Padding(
              padding: EdgeInsets.only(top: MSizes.spaceBtwItems),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: MColors.primary
                  ),
                  onPressed:  controller.isLoading.value ? null : () => controller.updateProfile(),
                  child: controller.isLoading.value ? const  SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),) :
                  Text('Update'),
                ),
              ),
            )
                : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}