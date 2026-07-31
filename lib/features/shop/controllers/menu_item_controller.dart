import 'package:get/get.dart';
import 'package:munch_yum/data/repositories/menu_item_repository.dart';

import '../../../utils/snackbar/snack_bar.dart';
import '../models/menu_item_model.dart';

class MenuItemController extends GetxController {
  static MenuItemController get instance => Get.find();

  RxList<MenuItemModel> menuItems = <MenuItemModel>[].obs;
  RxBool isLoading = true.obs;
  final menuItemRepo = MenuItemRepository.instance;

  @override
  void onInit() {
    //
    fetchMenuItems();
    super.onInit();
  }

  Future<void> fetchMenuItems() async {
    isLoading.value = true;
    try{
      final snapshot = await menuItemRepo.fetchMenuItems();

      menuItems.assignAll(snapshot);

      isLoading.value = false;
    } catch (e) {
      MSnackBar.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
    isLoading.value = false;
    }
  }

  Future<void> fetchMenuItemsByCategory(String categoryName) async {
    try {
      isLoading.value = true;

      final result = await menuItemRepo.fetchMenuItemsByCategory(categoryName);

      menuItems.assignAll(result);
      isLoading.value = false;
    } catch (e) {
      MSnackBar.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      isLoading.value = false;
    }

  }

  // helper function to get items by category the category
  List<MenuItemModel> getItemsByCategory(String categoryName) {
    return menuItems.where((item) => item.category == categoryName).toList();
  }

  double getDiscountedPrice(MenuItemModel item) {
    return item.hasDiscount ? item.discountPrice ?? item.price : item.price;
  }


}