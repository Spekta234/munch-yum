import 'package:get/get.dart';
import 'package:munch_yum/features/shop/models/cart_item_model.dart';
import 'package:munch_yum/features/shop/models/menu_item_model.dart';
import 'package:munch_yum/utils/local_storage/storage_utility.dart';
import 'package:munch_yum/utils/snackbar/snack_bar.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  final RxBool isAddedToCart = false.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt noOfCartItems = 0.obs;
  RxList<CartItemModel> cartItem = <CartItemModel>[].obs;


  CartController () {
    loadCartItems();
  }

  int getQuantity(String itemId) {
    final item = cartItem.firstWhereOrNull((cartItem) => cartItem.itemId == itemId);
    return item != null ? item.quantity : 0;
  }


  void addToCart(MenuItemModel menuItem, {int quantity = 1}) {
    if (menuItem.isOutOfStock) {
      MSnackBar.customToast(message: 'This item is out of stock');
      return;
    }

    final existingItem = cartItem.firstWhereOrNull((item) => item.itemId == menuItem.id);
    if (existingItem != null) {
      existingItem.quantity += quantity;
      cartItem.refresh();
    } else {
      cartItem.add(_toCartItems(menuItem, quantity));
    }
    saveCartItems();
    MSnackBar.customToast(message: 'Added to cart successfully');
  }

  void increaseQuantity(String itemId) {
    final item = cartItem.firstWhereOrNull((item) => item.itemId == itemId);
    if (item != null) {
      item.quantity++;
      cartItem.refresh();
      saveCartItems();
    }
  }



  void decreaseQuantity(String itemId) {
   final item = cartItem.firstWhereOrNull((item) => item.itemId == itemId);
   if (item != null && item.quantity > 1) {
     item.quantity--;
     cartItem.refresh();
     saveCartItems();
   } else {
     cartItem.removeWhere((item) => item.itemId == itemId);
     cartItem.refresh();
     saveCartItems();
   }
  }

  CartItemModel _toCartItems(MenuItemModel menuItem, int quantity,) {
    return CartItemModel(
      itemId: menuItem.id,
      title: menuItem.title,
      image: menuItem.image,
      quantity: quantity,
      price: menuItem.price,
      discountPrice: menuItem.discountPrice ?? 0.0,
      hasDiscount: menuItem.hasDiscount,
      category: menuItem.category,
    );
  }

  Future<void> saveCartItems() async  {
    final cartItemStrings = cartItem.map((item) => item.toJson()).toList();
    updateCartTotals();
    MLocalStorage.instance().writeData('cartItems', cartItemStrings);
    final verify = MLocalStorage.instance().readData<List<dynamic>>('cartItems');
    print('VERIFY RIGHT AFTER SAVE: $verify');
  }

  void loadCartItems() {
    final cartItemStrings = MLocalStorage.instance().readData<List<dynamic>>('cartItems');
    print('LOADED CART: $cartItemStrings');
    if (cartItemStrings != null) {
      cartItem.assignAll(cartItemStrings.map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotals();
    }
  }

  void updateCartTotals() {
    noOfCartItems.value = cartItem.length;

    double total = 0.0;
    for (var item in cartItem) {
      final unitPice = item.hasDiscount ? item.discountPrice : item.price;
      total += unitPice * item.quantity;
    }
    totalCartPrice.value = total;
  }

  void removeCartItem(String itemId) {
    cartItem.removeWhere((item) => item.itemId == itemId);
    saveCartItems();
    updateCartTotals();
  }

  void clearCart() {
    cartItem.clear();
    updateCartTotals();
    saveCartItems();
  }
}
