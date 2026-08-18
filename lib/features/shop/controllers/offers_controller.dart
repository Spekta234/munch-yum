import 'package:get/get.dart';
import 'package:munch_yum/features/shop/controllers/menu_item_controller.dart';
import 'package:munch_yum/features/shop/models/menu_item_model.dart';
import 'package:munch_yum/utils/snackbar/snack_bar.dart';

class OffersController extends GetxController {
  static OffersController get instance => Get.find();

  RxBool isLoading = true.obs;
  final menuItemController = MenuItemController.instance;
  RxList<MenuItemModel> offerItems = <MenuItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchOffers();
  }


  void fetchOffers() async {
    try{
      isLoading.value = true;
      final result = await menuItemController.menuItemRepo.fetchMenuItemsByCategory('Promo');
      offerItems.value = result;
    } catch (e) {
      MSnackBar.errorSnackBar(title: 'Oh snap', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}