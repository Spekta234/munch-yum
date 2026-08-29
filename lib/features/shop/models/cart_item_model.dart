class CartItemModel {
  String itemId;
  String title;
  String? image;
  int quantity;
  double price;
  double discountPrice;
  bool hasDiscount;
  String? category;

  CartItemModel({
    required this.itemId,
    this.title = '',
    this.image,
    required this.quantity,
    this.price = 0.0,
    this.discountPrice = 0.0,
    this.hasDiscount = false,
    this.category
  });

  /// Empty helper
  static CartItemModel empty() => CartItemModel(itemId: '', quantity: 0);

  /// ToJson
  Map<String, dynamic> toJson() {
    return {
      'itemId' : itemId,
      'title' : title,
      'image' : image,
      'quantity' : quantity,
      'price' : price,
      'discountPrice' : discountPrice,
      'hasDiscount' : hasDiscount,
      'category' : category,
    };
  }

  /// FromJson
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel (
      itemId: json['itemId'] ?? '',
      title: json['title'] ?? '',
      image: json['image'],
      quantity: json['quantity'] ?? 0,
      price: (json['price'] ?? 0.0).toDouble(),
      discountPrice: (json['discountPrice'] ?? 0.0).toDouble(),
      hasDiscount: json['hasDiscount'] ?? false,
      category: json['category'],
    );
  }

}