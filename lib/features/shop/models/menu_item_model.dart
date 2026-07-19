import 'package:cloud_firestore/cloud_firestore.dart';

class MenuItemModel {
  String id;
  String title;
  double price;
  String image;
  String category;
  bool isOutOfStock;
  bool hasDiscount;
  double? discountPrice;

  MenuItemModel({
   required this.id,
   required this.title,
   required this.price,
   required this.image,
   required this.category,
   required this.isOutOfStock,
   required this.hasDiscount,
    this.discountPrice,
  });

  static MenuItemModel empty () => MenuItemModel(id: '', title: '', price: 0, image: '', category: '', isOutOfStock: false, hasDiscount: false);

  Map<String, dynamic> toJson() {
    return {
      'Title' : title,
      'Price' : price,
      'Image' : image,
      'Category' : category,
      'IsOutOfStock' : isOutOfStock,
      'HasDiscount' : hasDiscount,
      'DiscountPrice' : discountPrice,
    };
  }

  factory MenuItemModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return MenuItemModel(
        id: document.id,
        title: data['Title'] ?? "",
        price: double.parse((data ['Price'] ?? 0.0).toString()),
        image: data ['Image'] ?? "",
        category: data ['Category'] ?? "",
        isOutOfStock: data ['IsOutOfStock'] ?? false,
        hasDiscount: data ['HasDiscount'] ?? false,
        discountPrice: double.parse((data ['DiscountPrice'] ?? 0.0).toString()),
      );
    } else {
      return MenuItemModel.empty();
    }
  }
}