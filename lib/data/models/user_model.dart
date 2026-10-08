import 'package:cloud_firestore/cloud_firestore.dart';

import '../../utils/enums/enums.dart';

class UserModel {
  /// Model class representing user data
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String selectedOutlet;
  final String gender;
  final String dateOfBirth;
  final int loyaltyPoints;
  final int lifeTimePoints;
  final bool hasSelectedLocation;
  final bool hasActivatedLoyalty;
  final String? loyaltyOutletCode;



  /// Constructor to initialize the user model
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.selectedOutlet,
    required this.gender,
    required this.dateOfBirth,
    required this.loyaltyPoints,
    required this.hasSelectedLocation,
    required this.hasActivatedLoyalty,
    this.loyaltyOutletCode,
    required this.lifeTimePoints,
  });


  /// Helper function get the full name
  String get fullName => '$firstName $lastName';

  /// Static function to split full name into first and last name
  static List<String> splitFullName(String fullName) {
    final parts = fullName.trim().split(' ');
    final first = parts.first;
    final last = parts.length > 1 ? parts.sublist(1).join(' ') : '';
    return [first, last];
  }


  /// Getter for loyalty tier
  LoyaltyTier get tier {
    if (loyaltyPoints >= 300) return LoyaltyTier.platinum;
    if (loyaltyPoints >= 200) return LoyaltyTier.diamond;
    if (loyaltyPoints >= 100) return LoyaltyTier.gold;
    if (loyaltyPoints >= 50) return LoyaltyTier.silver;
    if (loyaltyPoints >= 20) return LoyaltyTier.bronze;
    return LoyaltyTier.ruby;
  }

  /// Static function to create a user model
  static UserModel empty() => UserModel(
    id: '',
    firstName: '',
    lastName: '',
    email: '',
    phoneNumber: '',
    selectedOutlet: '',
    gender: '',
    dateOfBirth: '',
    loyaltyPoints: 0,
    lifeTimePoints: 0,
    loyaltyOutletCode: '',
    hasSelectedLocation: false,
    hasActivatedLoyalty: false,
  );

  /// Convert model to JSON structure for storing data in Firebase.
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'SelectedOutlet': selectedOutlet,
      'Gender': gender,
      'DateOfBirth': dateOfBirth,
      'LoyaltyPoints': loyaltyPoints,
      'LifetimePoints' : lifeTimePoints,
      'HasSelectedLocation': hasSelectedLocation,
      'HasActivatedLoyalty': hasActivatedLoyalty,
      'LoyaltyOutletCode' : loyaltyOutletCode,
    };
  }

  /// Factory method to create a UserModel from a Firebase document snapshot
  factory UserModel.fromSnapshot(
       DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? "",
        lastName: data['LastName'] ?? "",
        email: data['Email'] ?? "",
        phoneNumber: data['PhoneNumber'] ?? "",
        selectedOutlet: data['SelectedOutlet'] ?? "",
        gender: data['Gender'] ?? "",
        dateOfBirth: data['DateOfBirth'] ?? "",
        loyaltyPoints: data['LoyaltyPoints'] ?? 0,
        lifeTimePoints: data['LifetimePoints'] ?? 0,
        hasSelectedLocation: data['HasSelectedLocation'] ?? false,
        hasActivatedLoyalty: data['HasActivatedLoyalty'] ?? false,
        loyaltyOutletCode: data['LoyaltyOutletCode'] ?? "",

      );
    } else {
      return UserModel.empty();
    }
  }
}