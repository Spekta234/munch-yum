import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_yum/features/shop/controllers/category_controller.dart';
import 'package:munch_yum/utils/constants/colors.dart';

class HomeCategory extends StatelessWidget {
  const HomeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) =>
         GestureDetector(
           onTap: () => controller.onCategorySelected(index),
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 8),
             child: Column(
               children: [
                 SizedBox(
                   width: 60,
                   height: 60,
                   child: Stack(
                     alignment: Alignment.center,
                     children: [
                       Container(
                         width: 60,
                         height: 60,
                         decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           border: Border.all(
                             color: controller.selectedCategoryIndex.value == index
                                 ? MColors.primary
                                 : Colors.grey,
                             width: 2,
                           ),
                         ),
                       ),
                       // ── Image — smaller, sits upper center ──
                       Positioned(
                         top: 7,
                         child: Image.asset(
                           controller.categories[index].image,
                           width: 35,
                           height: 35,
                           fit: BoxFit.contain,
                         ),
                       ),
                       // ── Text with colored pill at bottom ──
                       Positioned(
                         bottom: 8,
                         child: Container(
                           padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                           decoration: BoxDecoration(
                             color: controller.categories[index].backgroundColor,
                             borderRadius: BorderRadius.circular(12),
                           ),
                           child: Text(
                             controller.categories[index].name,
                             style: TextStyle(fontSize: 9, fontWeight: FontWeight.w500),
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
               ],
             ),
           ),
         )
      ),
    );
  }
}
