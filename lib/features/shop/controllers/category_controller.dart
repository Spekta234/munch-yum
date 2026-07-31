import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_yum/data/repositories/category_repository.dart';
import 'package:munch_yum/features/shop/controllers/menu_item_controller.dart';
import 'package:munch_yum/features/shop/models/category_model.dart';
import 'package:munch_yum/utils/constants/colors.dart';
import 'package:munch_yum/utils/constants/image_strings.dart';
import 'package:munch_yum/utils/snackbar/snack_bar.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final RxInt selectedCategoryIndex = 0.obs;
  final RxList<CategoryModel> categories = <CategoryModel>[].obs;
  final categoryRepo = CategoryRepository.instance;


  // final categories = [
  //   CategoryModel(id: '1', name: 'All', image: MImages.category1, backgroundColor: 0xFFfff2ea),
  //   CategoryModel(id: '2', name: 'Food', image: MImages.category2, backgroundColor: 0xFFf2fefc),
  //   CategoryModel(id: '3', name: 'Protein', image: MImages.category3, backgroundColor: 0xFFf2fefc),
  //   CategoryModel(id: '4', name: 'Pastry', image: MImages.category4, backgroundColor: 0xFFffebea),
  //   CategoryModel(id: '5', name: 'Cake', image: MImages.category5, backgroundColor: 0xFFe9f2f1),
  //   CategoryModel(id: '6', name: 'Shawarma', image: MImages.category6, backgroundColor: 0xFFe9f2f1),
  //   CategoryModel(id: '7', name: 'Bread', image: MImages.category7, backgroundColor: 0xFFfff2ea),
  //   CategoryModel(id: '8', name: 'Drinks', image: MImages.category8, backgroundColor: 0xFFffe1c9),
  //   CategoryModel(id: '9', name: 'Ice cream', image: MImages.category9, backgroundColor: 0xFFffe1c9),
  // ];


  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  // fetch Categories
  Future<void> fetchCategories() async {
    try {
      final result = await categoryRepo.fetchCategories();
      categories.assignAll(result);
    } catch (e) {
      MSnackBar.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }


  // fetch products by categories
  void onCategorySelected(int index) {
    selectedCategoryIndex.value = index;

    final categoryName = categories[index].name;

    if (categoryName == 'All') {
      // fetch all items
      MenuItemController.instance.fetchMenuItems();
    } else {
      // fetch by category name selected
      MenuItemController.instance.fetchMenuItemsByCategory(categoryName);
    }
  }


}