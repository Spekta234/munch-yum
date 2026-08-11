import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:munch_yum/data/repositories/menu_item_repository.dart';
import 'package:munch_yum/features/shop/models/menu_item_model.dart';

import '../screens/menu_details/menu_details.dart';
import 'menu_item_controller.dart';

class SearchController extends GetxController {
  static SearchController get instance => Get.find();

  final menuRepo = MenuItemRepository.instance;
  RxList <MenuItemModel> popularItems = <MenuItemModel>[].obs;
  RxList<MenuItemModel> recentItems = <MenuItemModel>[].obs;
  final storage = GetStorage();
  static const String recentSearchKey = 'recentSearches';
  final menuItemController = MenuItemController.instance;


  @override
  void onInit() {
    super.onInit();
    fetchPopularItems();
  }

  void fetchPopularItems() async {
    popularItems.value = await menuRepo.fetchPopularItems();
  }




  void loadRecentSearches() {
    final List<String> ids = List<String>.from(storage.read(recentSearchKey) ?? []);
    recentItems.value = ids
        .map((id) => menuItemController.menuItems.firstWhereOrNull((item) => item.id == id))
        .whereType<MenuItemModel>()
        .toList();
  }

  void addToRecentSearches(MenuItemModel item) {
    List<String> ids = List<String>.from(storage.read(recentSearchKey) ?? []);
    ids.remove(item.id); // avoid duplicates
    ids.insert(0, item.id);
    if (ids.length > 5) ids = ids.sublist(0, 5); // cap at 5
    storage.write(recentSearchKey, ids);
    loadRecentSearches();
  }

  void clearRecentSearches() {
    storage.remove(recentSearchKey);
    recentItems.clear();
  }

  void onItemTap(MenuItemModel item) {
    menuRepo.updateSearchCount(item.id);
    addToRecentSearches(item);
    Get.to(() => MenuDetails(menuItem: item));
  }



}