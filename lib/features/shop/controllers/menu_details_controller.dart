import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MenuDetailsController extends GetxController {
  static MenuDetailsController get instance => Get.find();

  final RxInt quantity = 1.obs;

  double totalPrice(double price) => price * quantity.value;

  void increase() => quantity.value++;

  void decrease() {
    if (quantity.value > 1) quantity.value--;
  }
}