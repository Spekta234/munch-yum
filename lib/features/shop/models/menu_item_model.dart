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
  String description;
  int searchCount;

  MenuItemModel({
   required this.id,
   required this.title,
   required this.price,
   required this.image,
   required this.category,
   required this.isOutOfStock,
   required this.hasDiscount,
    this.discountPrice,
   required this.description,
    this.searchCount = 0,
  });

  static MenuItemModel empty () => MenuItemModel(id: '', title: '', price: 0, image: '', category: '', isOutOfStock: false, hasDiscount: false, description: '', searchCount: 0);

  Map<String, dynamic> toJson() {
    return {
      'Title' : title,
      'Price' : price,
      'Image' : image,
      'Category' : category,
      'IsOutOfStock' : isOutOfStock,
      'HasDiscount' : hasDiscount,
      'DiscountPrice' : discountPrice,
      'Description' : description,
      'SearchCount' : searchCount,
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
        description: data ['Description'] ?? "",
        searchCount: data ['SearchCount'] ?? 0,
      );
    } else {
      return MenuItemModel.empty();
    }
  }
}