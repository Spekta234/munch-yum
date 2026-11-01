import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_yum/common/widgets/bottomsheets/re-auth_buttomsheet.dart';
import 'package:munch_yum/data/repositories/user_repository.dart';
import 'package:munch_yum/features/authentication/controllers/re-auth_controller.dart';
import 'package:munch_yum/features/shop/controllers/home_controller.dart';

import '../../../data/repositories/authentication_repository.dart';
import '../../../navigation_menu.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/local_storage/storage_utility.dart';
import '../../../utils/snackbar/snack_bar.dart';
import '../../authentication/screens/login/login.dart';
import '../../shop/controllers/cart_controller.dart';
import '../../shop/controllers/checkout_controller.dart';
import '../../shop/controllers/order_controller.dart';
import 'loyalty_controller.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  RxBool isLoading = false.obs;
  final _storage = MLocalStorage.instance();
  final List<String> avatars = [
    MImages.chickenAvatar,
    MImages.ava1,
    MImages.ava2,
    MImages.ava3,
    MImages.ava4,
    MImages.ava5,
    MImages.ava6,
    MImages.ava7,

  ];
  final RxString selectedMonth = ''.obs;
  final RxString selectedDay = ''.obs;
  final RxString dob = ''.obs;
  final RxBool isEditing = false.obs;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNo = TextEditingController();
  final email = TextEditingController();
  final RxString selectedGender = ''.obs;
  GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();





  // selected avatar
  Future<void> onAvatarSelected(String avatar) async {
    try {
    await UserRepository.instance.updateSingleField({'Avatar' : avatar});
      await HomeController.instance.fetchUserData();
    } catch (e) {
      MSnackBar.errorSnackBar(title: 'Could not save avatar', message: e.toString());
    }
  }

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


  bool get canEditLoyaltyFields =>
      isEditing.value && HomeController.instance.user.value.hasActivatedLoyalty;



  void toggleEdit() {
    if (isEditing.value) loadFromUser();
    isEditing.value = !isEditing.value;
  }

  void loadFromUser() {
    final user = HomeController.instance.user.value;

    if(user.id.isEmpty) return;

    firstName.text = user.firstName;
    lastName.text = user.lastName;
    phoneNo.text = user.phoneNumber;

    final hasLoyalty = user.hasActivatedLoyalty;
    selectedGender.value = hasLoyalty ? user.gender : '';
    email.text = user.email;




    final savedDob = hasLoyalty ? user.dateOfBirth : '';
    dob.value = savedDob;
    selectedDay.value = '';
    selectedMonth.value = '';
    if(savedDob.isNotEmpty) {
     final parts = savedDob.split(' ');
     if (parts.length == 2) {
       selectedDay.value = parts[0];
       selectedMonth.value = parts[1];
     }
    }
  }

  Future<void> resetAllState() async {
    await CartController.instance.clearCart();
    CheckoutController.instance.resetCheckout();
    OrderController.instance.resetOrder();
    LoyaltyController.instance.resetLoyaltyFields();


    NavigationController.instance.goToHome();
  }



  Future<void> updateProfile() async {
    try {
      if (!profileFormKey.currentState!.validate()) return;

      final hasLoyalty = HomeController.instance.user.value.hasActivatedLoyalty;

      final dobComplete = dob.value.trim().split(' ').length == 2;
      if (hasLoyalty && (selectedGender.value.isEmpty || !dobComplete)) {
        MSnackBar.warningSnackBar(title: 'Incomplete details', message: 'Please select your gender and date of birth');
        return;
      }

      isLoading.value = true;

      final info = <String, dynamic>{
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim(),
        'PhoneNumber': phoneNo.text.trim(),
        if (hasLoyalty) 'Gender': selectedGender.value,
        if (hasLoyalty) 'DateOfBirth': dob.value,
      };
      await UserRepository.instance.updateSingleField(info);
      await HomeController.instance.fetchUserData();

      toggleEdit();
      MSnackBar.successSnackBar(title: 'Profile updated', message: 'Your details have been saved');
    } catch (e) {
      MSnackBar.errorSnackBar(title: 'Update failed', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteAccount(BuildContext context) async {

    final confirmed = await showDialog<bool>(context: context, builder: (dialogContext) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('Delete your account'),
        content: const Text('Are you sure you want to delete your account? This can\'t be undone'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('No', style: TextStyle(color: MColors.black )),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext, true);
            },
            child: const Text('Yes', style: TextStyle(color: MColors.primary)),
          )
        ],
      );

    }
    );

    if (confirmed != true) return;

    final verified =   await Get.bottomSheet<bool>(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      ReAuthBottomSheet(
        title: 'Confirm your password to proceed',
        subTitle: 'In order to delete your account, you must provide your password so we know it\'s really you.',),
    ).whenComplete(() => ReAuthController.instance.resetForm());

    if (verified != true) return;
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      MSnackBar.errorSnackBar(title: 'Error', message: 'No user is signed in');
      return;
    }
    final userId = user.uid;

    try {

      await UserRepository.instance.deleteUserAddresses(userId);
      print('addresses deleted');

      await UserRepository.instance.deleteUserOrders(userId);
      print('Orders deleted');

      await UserRepository.instance.removeUserRecord(userId);
      print('user doc deleted');

      await AuthenticationRepository.instance.deleteUser();
      print('auth deleted');
    } catch (e) {
      MSnackBar.errorSnackBar(title: 'An error occurred', message: e.toString());
      return;
    }


    try {
      await resetAllState();
    } catch (e) {
      debugPrint('Reset failed: $e');
    }

    MSnackBar.customToast(message: 'Account deleted');

    Get.offAll(() => const LoginScreen());
  }
  }