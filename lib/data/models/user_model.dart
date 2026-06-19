import 'package:cloud_firestore/cloud_firestore.dart';

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
  final String loyaltyTier;
  final bool hasSelectedLocation;

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
    required this.loyaltyTier,
    required this.hasSelectedLocation,
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
    loyaltyTier: '',
    hasSelectedLocation: false,
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
      'LoyaltyTier': loyaltyTier,
      'HasSelectedLocation': hasSelectedLocation,
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
        loyaltyTier: data['LoyaltyTier'] ?? "",
        hasSelectedLocation: data['HasSelectedLocation'] ?? false,
      );
    } else {
      return UserModel.empty();
    }
  }
}