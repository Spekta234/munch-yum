import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:munch_yum/data/repositories/address_repository.dart';
import 'package:munch_yum/data/repositories/order_repository.dart';
import 'package:munch_yum/features/personification/controllers/address_controller.dart';
import 'package:munch_yum/features/personification/controllers/profile_controller.dart';
import 'package:munch_yum/features/shop/controllers/cart_controller.dart';
import 'package:munch_yum/features/shop/controllers/category_controller.dart';
import 'package:munch_yum/features/shop/controllers/menu_details_controller.dart';
import 'package:munch_yum/features/shop/controllers/offers_controller.dart';
import 'package:munch_yum/navigation_menu.dart';

import '../data/repositories/category_repository.dart';
import '../data/repositories/menu_item_repository.dart';
import '../data/repositories/user_repository.dart';
import '../features/shop/controllers/checkout_controller.dart';
import '../features/shop/controllers/home_controller.dart';
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
    Get.put(ProfileController());
    Get.lazyPut (() => HomeController(), fenix: true );
    Get.put(AddressController());
    Get.put(AddressRepository());
    Get.put(CheckoutController());
    Get.put(NavigationController());
    Get.put(OrderRepository());
  }
}