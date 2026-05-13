import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_yum/features/shop/screens/checkout/widgets/checkbox_row.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/checkout_controller.dart';

class DeliveryBottomSheet extends StatelessWidget {
  const DeliveryBottomSheet({super.key, this.isPickUp = false});

  final bool isPickUp;
  
  /// Generate dates from moro to 30 days
  List<String> generateDates() {
    final List<String> dates = [];
    final now = DateTime.now();
    for (int i = 1; i <= 30; i++) {
      final date = now.add(Duration(days: i));
      dates.add('${date.day} ${monthName(date.month)} ${date.year}');
    }
    return dates;
  }

  /// Generate times from 9am to 6pm
  List<String> generateTimes() {
    return [
      '9:00 AM', '10:00 AM', '11:00 AM', '12:00 PM', '1:00 PM',
      '2:00 PM', '3:00 PM', '4:00 PM', '5:00 PM', '6:00 PM'
    ];
  }

  String monthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }
  
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    return Padding(
      padding: EdgeInsets.all(MSizes.md),
      child: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// close button
            Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                backgroundColor: Colors.red.shade100,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close),
                ),
              ),
            ),
           const SizedBox(height: MSizes.md),
            /// Title
            Text(isPickUp ? 'When would you like to pick up' : 'When should we deliver your meal', style: Theme.of(context).textTheme.headlineSmall,),
            const SizedBox(height: MSizes.md),
            /// Checkboxes
            Column(
              children: [
                MCheckboxRow(
                  title: isPickUp ? 'Instant pickup (You pick up today)' : 'Instant delivery (We deliver today)',
                  price: '',
                  isSelected: controller.deliveryTime.value == 'Instant delivery' || controller.deliveryTime.value == 'Instant pickup',
                  onTap: () => controller.deliveryTime.value = isPickUp ? 'Instant pickup' : 'Instant delivery',
                ),
                const SizedBox(height: MSizes.sm),
                MCheckboxRow(
                  title: isPickUp ? 'Later (You pick up another day)' : 'Later (We deliver another day)',
                  price: '',
                  isSelected: controller.deliveryTime.value == 'Later',
                  onTap: () => controller.deliveryTime.value = 'Later',
                ),
                /// show date and time if later is selected
                Obx ( () => controller.deliveryTime.value == 'Later'
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: MSizes.md),
                    Text(isPickUp? 'Pick up date' : 'Delivery date',style: Theme.of(context).textTheme.bodyLarge!.apply(color: MColors.darkerGrey)),
                    const SizedBox(height: MSizes.sm),
                    DropdownButtonFormField(
                      value: controller.selectedDate.value.isEmpty
                          ? null : controller.selectedDate.value,
                      hint: Text(isPickUp ? 'Select pick up date' : 'Select delivery date', style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.grey),),
                      icon: Icon(Icons.keyboard_arrow_down),
                      decoration: InputDecoration(
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
                      items: generateDates()
                          .map((date) => DropdownMenuItem(
                        value: date,
                        child: Text(date),
                      )).toList(),
                      onChanged: (value) => controller.selectedDate.value = value!,
                    ),
                    const SizedBox(height: MSizes.spaceBtwItems),
                    Text(isPickUp? 'Pick up time' : 'Delivery time',style: Theme.of(context).textTheme.bodyLarge!.apply(color: MColors.darkerGrey)),
                    const SizedBox(height: MSizes.sm),
                    DropdownButtonFormField(
                      value: controller.selectedTime.value.isEmpty
                          ? null : controller.selectedTime.value,
                      hint: Text(isPickUp ? 'Select pick up time' : 'Select delivery time', style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.grey),),
                      icon: Icon(Icons.keyboard_arrow_down),
                      decoration: InputDecoration(
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
                      items: generateTimes()
                          .map((time) => DropdownMenuItem(
                        value: time,
                        child: Text(time),
                      )).toList(),
                      onChanged: (value) => controller.selectedTime.value = value!,
                    ),
                  ],
                ) : const SizedBox()
                ),


                const SizedBox(height: MSizes.xxl),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Done'),
                  ),
                ),
                const SizedBox(height: MSizes.md),
              ],
            ),
          ],
            ),
      ),
    );
  }
}
