import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_yum/features/shop/controllers/category_controller.dart';
import 'package:munch_yum/utils/constants/colors.dart';


//
// class HomeCategory extends StatelessWidget {
//   const HomeCategory({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(CategoryController());
//     return SizedBox(
//       height: 90,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: controller.categories.length,
//         itemBuilder: (context, index) => Obx(
//               () => GestureDetector(
//             onTap: () => controller.onCategorySelected(index),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8),
//               child: Column(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(
//                         color: controller.selectedCategoryIndex.value == index
//                             ? MColors.primary
//                             : Colors.grey,
//                         width: 2,
//                       ),
//                     ),
//                     child: ClipOval(
//                       child: Container(
//                         width: 45,
//                         height: 45,
//                         child: Stack(
//                           alignment: Alignment.center,
//                           children: [
//                             // Image
//                             Positioned(
//                               top: 7,
//                               child: Image.network(
//                                 controller.categories[index].image,
//                                 width: 20,
//                                 height: 20,
//                                 fit: BoxFit.contain,
//                               ),
//                             ),
//                             // ── D shape text at bottom ──
//                             Positioned(
//                               bottom: 0,
//                               child: Container(
//                                 width: 70,
//                                 padding: EdgeInsets.symmetric(vertical: 2),
//                                 color: Color(controller.categories[index].backgroundColor),
//                                 child: Text(
//                                   controller.categories[index].name,
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     fontSize: 9,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class HomeCategory extends StatelessWidget {
  const HomeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    // ── CHANGED: Wrapped SizedBox with Obx() to react to fetched categories ──
    return Obx(() => SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) => Obx(
              () => GestureDetector(
            onTap: () => controller.onCategorySelected(index),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: controller.selectedCategoryIndex.value == index
                            ? MColors.primary
                            : Colors.grey,
                        width: 2,
                      ),
                    ),
                    child: ClipOval(
                      child: Container(
                        width: 45,
                        height: 45,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              top: 7,
                              // ── CHANGED: Image.asset → Image.network (images now from Firestore URL) ──
                              child: Image.network(
                                controller.categories[index].image,
                                width: 20,
                                height: 20,
                                fit: BoxFit.contain,
                                // ── CHANGED: Added errorBuilder for when image URL is empty or broken ──
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(Icons.image_not_supported, size: 20, color: Colors.grey),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                width: 70,
                                padding: EdgeInsets.symmetric(vertical: 2),
                                color: Color(controller.categories[index].backgroundColor),
                                child: Text(
                                  controller.categories[index].name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}

