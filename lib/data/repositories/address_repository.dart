import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:munch_yum/data/repositories/authentication_repository.dart';
import 'package:munch_yum/features/personification/models/address_model.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  /// variables
  final _db = FirebaseFirestore.instance;

  /// Add new Address
  Future<String> addNewAddress(AddressModel address) async {
    try {
      final userId = AuthenticationRepository.instance.authUser?.uid;
      final currentAddress = await _db.collection('Users').doc(userId).collection('Addresses').add(address.toJson());
      return currentAddress.id;
    } catch (e) {
      throw 'Something went wrong while saving new address, try again later';
    }
  }

  /// Fetch User Address
  Future<List<AddressModel>> fetchUserAddress() async {
    try{
      final userId = AuthenticationRepository.instance.authUser?.uid;
      if (userId!.isEmpty) throw 'Unable to find user information. Try again in few minutes';
      final result = await _db.collection('Users').doc(userId).collection('Addresses').get();
      return result.docs.map((documentSnapshot) => AddressModel.fromSnapshot(documentSnapshot)).toList();

    } catch (e) {
      throw 'Something went wrong fetching Address information, please try again later';
    }
  }

  /// Delete Address
  Future<void> deleteUserAddress(String addressId) async {
    try {
      final userId = AuthenticationRepository.instance.authUser?.uid;
      await _db.collection('Users').doc(userId).collection('Addresses').doc(addressId).delete();
    } catch (e) {
      throw 'Something went wrong deleting Address information, please try again later';
    }
  }

  /// Set Default Address
  Future<void> setDefaultAddress(String? previousDefaultId, String newDefaultId) async {
    try {
      final userId = AuthenticationRepository.instance.authUser?.uid;
      final addressesRef = _db.collection('Users').doc(userId).collection('Addresses');

      // un-default the old one, only if one existed
      if (previousDefaultId != null && previousDefaultId.isNotEmpty) {
        await addressesRef.doc(previousDefaultId).update({'IsDefault' : false});
      }

      // set the new one as default
      await addressesRef.doc(newDefaultId).update({'IsDefault' : true});

    } catch (e) {
      throw 'Something went wrong';
    }
  }

}