import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/repositories/authentication_repository.dart';
import '../../../data/repositories/user_repository.dart';
import '../../../navigation_menu.dart';
import '../../../utils/snackbar/snack_bar.dart';

class LoyaltyController extends GetxController {
  static LoyaltyController get instance => Get.find();

  final RxString selectedMonth = ''.obs;
  final RxString selectedDay = ''.obs;
  final RxString dob = ''.obs;
  final selectedGender = ''.obs;
  final RxBool hasAgreed = false.obs;
  final loyaltyFormKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final outletCode = TextEditingController();
  final gender = ''.obs;
  final isLoading = false.obs;

  void updateDOB(){
    dob.value = '${selectedDay.value} ${selectedMonth.value}';
  }

  /// Returns max days for selected month
  int get maxDays {
    const monthDays = {
      'January': 31, 'February': 28, 'March': 31,
      'April': 30, 'May': 31, 'June': 30,
      'July': 31, 'August': 31, 'September': 30,
      'October': 31, 'November': 30, 'December': 31,
    };
    return monthDays[selectedMonth.value] ?? 31;
  }

  /// Clear day if it exceeds max days
  void onMonthChanged(String month) {
    selectedMonth.value = month;
    // clear day if it no longer exists in new month
    if (selectedDay.value.isNotEmpty) {
      final day = int.parse(selectedDay.value.replaceAll(RegExp(r'[^0-9]'), ''));
      if (day > maxDays) selectedDay.value = '';
    }
  }

  Future<void> activateLoyalty() async {
    try {
      if (!loyaltyFormKey.currentState!.validate()) return;
      if (!hasAgreed.value) return;

      isLoading.value = true;

      final userId = AuthenticationRepository.instance.authUser!.uid;
      await UserRepository.instance.activateLoyalty(userId);

      isLoading.value = false;
      MSnackBar.successSnackBar(title: 'Success', message: 'Loyalty program activated!');
      Get.offAll(() => const NavigationMenu());

    } catch (e) {
      isLoading.value = false;
      MSnackBar.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }


}