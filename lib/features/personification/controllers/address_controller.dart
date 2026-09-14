import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_yum/data/repositories/address_repository.dart';
import 'package:munch_yum/utils/snackbar/snack_bar.dart';

import '../models/address_model.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  /// variables
  RxBool isLoading = false.obs;
  RxList<AddressModel> addresses = <AddressModel>[].obs;
  Rx<AddressModel?> selectedAddress = Rx<AddressModel?>(null);
  final deliveryLocation = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    fetchAddresses();
    super.onInit();
  }


  Future<void> fetchAddresses() async {
    try {
      final address = await AddressRepository.instance.fetchUserAddress();
      addresses.assignAll(address); // ← missing line
      selectedAddress.value = address.firstWhereOrNull((element) => element.isDefault);
    } catch (e) {
      MSnackBar.errorSnackBar(title: 'Address not found', message: e.toString());
    }
  }

  Future selectAddress(AddressModel address) async {
    try{
      final previousId = selectedAddress.value?.id;
      await AddressRepository.instance.setDefaultAddress(previousId, address.id);
      selectedAddress.value =address;
      await fetchAddresses();
    } catch (e) {
      MSnackBar.errorSnackBar(title: 'Error selecting address', message: e.toString());
    }
  }

  Future addNewAddress(String addressText) async {
    try{
      // Start loading
      isLoading.value = true;

      // save address data
      final address = AddressModel(address: addressText, isDefault: false, id: '');
      final addressId = await AddressRepository.instance.addNewAddress(address);

      // stop loading
      isLoading.value = false;

      // show success message
      MSnackBar.successSnackBar(title: 'Address added successfully', message: 'Your new address has been added successfully');

      // fetch addresses
      await fetchAddresses();

    } catch (e) {
      // stop loading
      isLoading.value = false;
      MSnackBar.errorSnackBar(title: 'Error adding new address', message: e.toString());
    }
  }

  Future deleteAddress(String addressId) async {
    try {
      await AddressRepository.instance.deleteUserAddress(addressId);
      MSnackBar.successSnackBar(title: 'Address deleted successfully', message: 'Your address has been deleted successfully');
      await fetchAddresses();
    } catch (e) {
      MSnackBar.errorSnackBar(title: 'Error deleting address', message: e.toString());
    }
  }

}