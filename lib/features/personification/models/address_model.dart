import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel {
  String id;
  String address;
  bool isDefault;

  AddressModel({
    required this.id,
    required this.address,
    this.isDefault = false,
  });

  static AddressModel empty() => AddressModel(id: '', address: '');

  Map<String, dynamic> toJson() {
    return {
      'Address' : address,
      'IsDefault' : isDefault,
    };
  }

  factory AddressModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return AddressModel(
        id: document.id,
        address: data['Address'] ?? '',
        isDefault: data['IsDefault'] ?? false,
      );
    } else {
      return AddressModel.empty();
    }
  }
}