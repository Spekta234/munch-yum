import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  int backgroundColor;

  CategoryModel({
   required this.id,
   required this.name,
   required this.image,
   required this.backgroundColor,
  });

  static CategoryModel empty() => CategoryModel(id: '', name: '', image: '', backgroundColor:  0xFFE0E0E0);

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'BackgroundColor': backgroundColor,
    };
  }

  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return CategoryModel(
        id: document.id,
        name: data['Name'] ?? "",
        image: data['Image'] ?? "",
        backgroundColor: data['BackgroundColor'] ?? 0xFFE0E0E0,
      );
    } else {
      return CategoryModel.empty();
    }
  }

}