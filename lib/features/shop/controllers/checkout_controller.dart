import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:munch_yum/features/shop/controllers/cart_controller.dart';
import 'package:munch_yum/features/shop/models/cart_item_model.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  /// Variables
  final RxString orderingFor = 'Myself'.obs;
  final RxString packagingType = 'Branded nylon'.obs;
  final RxString orderMode = ''.obs;
  final RxString deliveryTime = 'Instant delivery'.obs;
  final RxString selectedTime = ''.obs;
  final RxString selectedDate = ''.obs;
  final RxString selectedPaymentMethod = ''.obs;
  double get packagingPrice {
    switch (packagingType.value) {
      case 'Branded nylon' :
        return 0;
      case 'Paper bag' :
        return 500;
      case 'Love box (ideal for gift)' :
        return 500;
      default:
        return 0;
    }
  }
  double get orderModePrice {
    switch (orderMode.value) {
      case 'Delivery':
        return 2000;
      case 'Pick up' :
        return 0;
      default:
        return 0;
    }
  }

  double get serviceCharge => 222;

  double get discount => 0;

  double get subtotal {
    return CartController.instance.cartItem.fold(0 , (total, item) => total + (item.price * item.quantity));
  }

  double get total => packagingPrice + orderModePrice + serviceCharge + subtotal - discount;

  final recipientName = TextEditingController();
  final recipientPhoneNo = TextEditingController();
  final specialNote = TextEditingController();
  final couponCode = TextEditingController();
  GlobalKey<FormState> checkoutFormKey = GlobalKey<FormState>();



  void selectMethod(String method) => selectedPaymentMethod.value = method;

  void resetCheckout() {
    orderingFor.value = 'Myself';
    packagingType.value = 'Branded nylon';
    orderMode.value = '';
    deliveryTime.value = 'Instant delivery';
    selectedTime.value = '';
    selectedDate.value = '';
    selectedPaymentMethod.value = '';
    recipientName.clear();
    recipientPhoneNo.clear();
    specialNote.clear();
    couponCode.clear();
  }
}