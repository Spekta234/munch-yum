import 'package:get/get.dart';

/// Don't forget to migrate into cart controller later!

class AddToCartBtnController extends GetxController {
  static AddToCartBtnController get instance => Get.find();

  final RxBool isAddedToCart = false.obs;
  final RxInt quantity = 1.obs;

  void addToCart() {
    isAddedToCart.value = true;
  }

  void increaseQuality() {
    quantity.value++;
  }

  void decreaseQuality() {
    if (quantity.value > 1) {
      quantity.value--;
    } else {
      isAddedToCart.value = false;
      quantity.value = 1;
    }
  }

}