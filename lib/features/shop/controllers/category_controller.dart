import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_yum/features/shop/models/category_model.dart';
import 'package:munch_yum/utils/constants/colors.dart';
import 'package:munch_yum/utils/constants/image_strings.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final RxInt selectedCategoryIndex = 0.obs;

  final categories = [
    CategoryModel(id: '1', name: 'All', image: MImages.category1, backgroundColor: MColors.categoryBackground),
    CategoryModel(id: '2', name: 'Food', image: MImages.category2, backgroundColor: MColors.categoryBackground2),
    CategoryModel(id: '3', name: 'Protein', image: MImages.category3, backgroundColor: MColors.categoryBackground2),
    CategoryModel(id: '4', name: 'Pastry', image: MImages.category4, backgroundColor: MColors.categoryBackground3),
    CategoryModel(id: '5', name: 'Cake', image: MImages.category5, backgroundColor: MColors.categoryBackground4),
    CategoryModel(id: '6', name: 'Shawarma', image: MImages.category6, backgroundColor: MColors.categoryBackground4),
    CategoryModel(id: '7', name: 'Bread', image: MImages.category7, backgroundColor: MColors.categoryBackground),
    CategoryModel(id: '8', name: 'Drinks', image: MImages.category8, backgroundColor: MColors.categoryBackground5),
    CategoryModel(id: '9', name: 'Ice cream', image: MImages.category9, backgroundColor: MColors.categoryBackground5),
  ];

  // fetch products by categories
  void onCategorySelected(int index) {
    selectedCategoryIndex.value = index;
  }
}