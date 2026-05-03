import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_yum/features/shop/controllers/category_controller.dart';
import 'package:munch_yum/utils/constants/colors.dart';

// class HomeCategory extends StatelessWidget {
//   const HomeCategory({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(CategoryController());
//     return SizedBox(
//       height: 100,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: controller.categories.length,
//         itemBuilder: (context, index) =>
//          Obx(
//            () => GestureDetector(
//              onTap: () => controller.onCategorySelected(index),
//              child: Padding(
//                padding: const EdgeInsets.symmetric(horizontal: 8),
//                child: Column(
//                  children: [
//                    SizedBox(
//                      width: 60,
//                      height: 60,
//                      child: Stack(
//                        alignment: Alignment.center,
//                        children: [
//                          Container(
//                            width: 60,
//                            height: 60,
//                            decoration: BoxDecoration(
//                              shape: BoxShape.circle,
//                              border: Border.all(
//                                color: controller.selectedCategoryIndex.value == index
//                                    ? MColors.primary
//                                    : Colors.grey,
//                                width: 2,
//                              ),
//                            ),
//                          ),
//                          // ── Image — smaller, sits upper center ──
//                          Positioned(
//                            top: 7,
//                            child: Image.asset(
//                              controller.categories[index].image,
//                              width: 35,
//                              height: 35,
//                              fit: BoxFit.contain,
//                            ),
//                          ),
//                          // ── Text with colored pill at bottom ──
//                          Positioned(
//                            bottom: 0,
//                            child: Container(
//                              width: 60,
//                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//                              decoration: BoxDecoration(
//                                color: controller.categories[index].backgroundColor,
//                                borderRadius: BorderRadius.only(
//                                  topLeft: Radius.circular(30),
//                                  topRight: Radius.circular(30),
//                                ),
//                              ),
//                              child: Text(
//                                controller.categories[index].name,
//                                textAlign: TextAlign.center,
//                                style: TextStyle(fontSize: 9, fontWeight: FontWeight.w500),
//                              ),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          )
//       ),
//     );
//   }
// }

class HomeCategory extends StatelessWidget {
  const HomeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return SizedBox(
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
                  // ── Border outside ClipOval ──
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
                        color: Colors.grey.shade100,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // ── Image ──
                            Positioned(
                              top: 7,
                              child: Image.asset(
                                controller.categories[index].image,
                                width: 20,
                                height: 20,
                                fit: BoxFit.contain,
                              ),
                            ),
                            // ── D shape text at bottom ──
                            Positioned(
                              bottom: 0,
                              child: Container(
                                width: 70,
                                padding: EdgeInsets.symmetric(vertical: 2),
                                color: controller.categories[index].backgroundColor,
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
    );
  }
}

