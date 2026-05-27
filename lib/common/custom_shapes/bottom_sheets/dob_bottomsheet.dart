import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:munch_yum/features/personification/controllers/profile_controller.dart';

import '../../../features/personification/controllers/loyalty_controller.dart';
import '../../../utils/constants/sizes.dart';

class DOBBottomSheet extends StatelessWidget {
  const DOBBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProfileController.instance;

    return Padding(
      padding: EdgeInsets.all(MSizes.lg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              'Select Month and Day',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: MSizes.spaceBtwSections),
          Center(
            child: Obx(() => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 150,
                  child: DropdownButton<String>(
                    value: controller.selectedMonth.value.isEmpty
                        ? null
                        : controller.selectedMonth.value,
                    hint: Text('Month'),
                    isExpanded: true,
                    icon: Icon(Icons.keyboard_arrow_down),
                    underline: Container(
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                    items: _generateMonths()
                        .map((month) => DropdownMenuItem(
                      value: month,
                      child: Text(month),
                    ))
                        .toList(),
                    onChanged:(value) => controller.onMonthChanged(value!),
                  ),
                ),
                SizedBox(width: MSizes.spaceBtwItems),
                SizedBox(
                  width: 100,
                  child: DropdownButton<String>(
                    value: controller.selectedDay.value.isEmpty
                        ? null
                        : controller.selectedDay.value,
                    hint: Text('Day'),
                    isExpanded: true,
                    icon: Icon(Icons.keyboard_arrow_down),
                    underline: Container(
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                    items: _generateDays(controller.maxDays)
                        .map((day) => DropdownMenuItem(
                      value: day,
                      child: Text(day),
                    ))
                        .toList(),
                    onChanged: (value) =>
                    controller.selectedDay.value = value!,
                  ),
                ),
              ],
            )),
          ),
          SizedBox(height: MSizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                controller.updateDOB();
                Navigator.pop(context);
              },
              child: Text('Done'),
            ),
          ),
          SizedBox(height: MSizes.md),
        ],
      ),
    );
  }

  List<String> _generateMonths() {
    return [
      'January', 'February', 'March', 'April',
      'May', 'June', 'July', 'August',
      'September', 'October', 'November', 'December'
    ];
  }

  List<String> _generateDays(int maxDays) {
    return List.generate(maxDays, (index) {
      final day = index + 1;
      if (day == 1 || day == 21 || day == 31) return '${day}st';
      if (day == 2 || day == 22) return '${day}nd';
      if (day == 3 || day == 23) return '${day}rd';
      return '${day}th';
    });
  }
}