import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:munch_yum/features/shop/controllers/cart_controller.dart';
import 'package:munch_yum/features/shop/controllers/category_controller.dart';
import 'package:munch_yum/features/shop/controllers/menu_details_controller.dart';
import 'package:munch_yum/features/shop/controllers/offers_controller.dart';

import '../data/repositories/category_repository.dart';
import '../data/repositories/menu_item_repository.dart';
import '../data/repositories/user_repository.dart';
import '../features/shop/controllers/menu_item_controller.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(UserRepository());
    Get.put(CategoryRepository());
    Get.put(MenuItemRepository());
    Get.put(MenuItemController());
    Get.put(CategoryController());
    Get.put(MenuDetailsController());
    Get.put(OffersController());
    Get.put(CartController());
  }
}