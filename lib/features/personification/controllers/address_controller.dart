import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_yum/data/repositories/address_repository.dart';
import 'package:munch_yum/utils/snackbar/snack_bar.dart';

import '../../../data/repositories/authentication_repository.dart';
import '../../../utils/helpers/navigation_helpers.dart';
import '../models/address_model.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  /// variables
  RxBool isLoading = false.obs;
  RxBool isFetching = false.obs;
  RxList<AddressModel> addresses = <AddressModel>[].obs;
  Rx<AddressModel?> selectedAddress = Rx<AddressModel?>(null);
  final deliveryLocation = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();



  Future<void> fetchAddresses() async {
    try {
      isFetching.value = true;
      final address = await AddressRepository.instance.fetchUserAddress();
      addresses.assignAll(address);
      selectedAddress.value = address.firstWhereOrNull((element) => element.isDefault);
    } catch (e) {
      MSnackBar.errorSnackBar(title: 'Address not found', message: e.toString());
    } finally {
      isFetching.value = false;
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
      deliveryLocation.clear();

      // fetch addresses
      final newAddress = AddressModel(id: addressId, address: addressText, isDefault: true);
      await selectAddress(newAddress);


      // show success message and go back
      MSnackBar.customToast(message: 'Address successfully added');
      mBack();



    } catch (e) {
      // stop loading
      isLoading.value = false;
      MSnackBar.errorSnackBar(title: 'Error adding new address', message: e.toString());
    }
  }

  Future deleteAddress(String addressId) async {
    try {
      await AddressRepository.instance.deleteUserAddress(addressId);
      MSnackBar.customToast(message: 'Address deleted successfully');
      await fetchAddresses();
    } catch (e) {
      MSnackBar.errorSnackBar(title: 'Error deleting address', message: e.toString());
    }
  }

}