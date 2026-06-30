import 'package:cloud_firestore/cloud_firestore.dart';

class StateModel {
  final String id;
  final String name;

  StateModel({required this.id, required this.name});

  factory StateModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    return StateModel(
      id: doc.id,
      name: doc.data()?['name'] ?? '',
    );
  }

}

class CityModel{
  final String id;
  final String name;

  CityModel({required this.id, required this.name});

  factory CityModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    return CityModel(
      id: doc.id,
      name: doc.data()?['name'] ?? '',
    );
  }
}

class OutletModel{
  final String id;
  final String name;

  OutletModel({required this.id, required this.name});

  factory OutletModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    return OutletModel(
      id: doc.id,
      name: doc.data()?['name'] ?? '',
    );
  }
}