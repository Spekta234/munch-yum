import 'package:get/get.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  /// Variables
  final RxString orderingFor = 'Myself'.obs;
  final RxString packagingType = 'Branded nylon'.obs;
  final RxString orderMode = ''.obs;
  final RxString deliveryTime = 'Instant delivery'.obs;
  final RxString selectedTime = ''.obs;
  final RxString selectedDate = ''.obs;
}