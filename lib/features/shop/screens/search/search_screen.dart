import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/common/custom_shapes/containers/rounded_container.dart';
import 'package:munch_yum/common/images/m_rounded_image.dart';
import 'package:munch_yum/common/widgets/appbar/appbar.dart';
import 'package:munch_yum/features/shop/controllers/search_controller.dart';
import 'package:munch_yum/utils/constants/colors.dart';
import 'package:munch_yum/utils/constants/image_strings.dart';
import 'package:munch_yum/utils/constants/sizes.dart';

import '../../../../common/menu/horizontal_menu_card.dart';
import '../../../../common/texts/menu_price_text.dart';
import '../../../../common/texts/menu_title_text.dart';

// class SearchScreen extends StatelessWidget {
//   const SearchScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(SearchController1());
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(MSizes.sm),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   IconButton(
//                     onPressed: () => Get.back(),
//                     icon: Icon(Icons.arrow_back_ios_new),
//                   ),
//                   Text(
//                     'Search Meals',
//                     style: Theme.of(
//                       context,
//                     ).textTheme.bodySmall!.apply(color: Colors.black),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: MSizes.sm),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         padding: EdgeInsets.symmetric(horizontal: 16),
//                         decoration: BoxDecoration(
//                           color: MColors.lightGrey,
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         child: TextField(
//                           controller: controller.searchTextController,
//                           onChanged: controller.searchQuery,
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.symmetric(
//                               vertical: 16,
//                               horizontal: 16,
//                             ),
//                             hintText: 'Search Meals...',
//                             helperStyle: Theme.of(context).textTheme.bodySmall,
//                             prefixIcon: Icon(Icons.search, color: Colors.grey),
//                             border: InputBorder.none,
//                             enabledBorder: InputBorder.none,
//                             focusedBorder: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     const SizedBox(width: 10),
//                     Container(
//                       padding: EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: MColors.lightGrey,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(Icons.filter_list, color: Colors.black),
//                     ),
//                   ],
//                 ),
//               ),
//
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('Recent Search'),
//                     TextButton(
//                       onPressed: () => controller.clearRecentSearches(),
//                       child: Text(
//                         'Clear search history',
//                         style: Theme.of(context).textTheme.labelSmall!.apply(
//                           color: MColors.primary,
//                           decoration: TextDecoration.underline,
//                           decorationColor: MColors.primary,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               Expanded(
//                 child:
//               ),
//             ],
//
//           ),
//         ),
//       ),
//     );
//   }
// }

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchController1());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.sm),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.arrow_back_ios_new),
                  ),
                  Text(
                    'Search Meals',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .apply(color: Colors.black),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: MSizes.sm),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: MColors.lightGrey,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextField(
                          controller: controller.searchTextController,
                          onChanged: controller.searchQuery,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 16,
                            ),
                            hintText: 'Search Meals...',
                            helperStyle: Theme.of(context).textTheme.bodySmall,
                            prefixIcon: Icon(Icons.search, color: Colors.grey),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: MColors.lightGrey,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.filter_list, color: Colors.black),
                    ),
                  ],
                ),
              ),

              /// Recent Search header — only makes sense outside active search
              Obx(
                    () => controller.isSearching.value
                    ? const SizedBox()
                    : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Recent Search'),
                      TextButton(
                        onPressed: () => controller.clearRecentSearches(),
                        child: Text(
                          'Clear search history',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .apply(
                            color: MColors.primary,
                            decoration: TextDecoration.underline,
                            decorationColor: MColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: Obx(() {
                  /// Active search — show filtered results
                  if (controller.isSearching.value) {
                    if (controller.searchResults.isEmpty) {
                      return const Center(child: Text('No items found'));
                    }
                    return ListView.separated(
                      itemCount: controller.searchResults.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final item = controller.searchResults[index];
                        return MMenuCardHorizontal(
                          menuItem: item,
                          onTap: item.isOutOfStock
                              ? null
                              : () => controller.onItemTap(item),
                        );
                      },
                    );
                  }

                  /// No active search — show Recent + Popular
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        /// Recent Searches
                        ListView.separated(
                          itemCount: controller.recentItems.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 10),
                          itemBuilder: (context, index) {
                            final item = controller.recentItems[index];
                            return MMenuCardHorizontal(
                              menuItem: item,
                              onTap: item.isOutOfStock
                                  ? null
                                  : () => controller.onItemTap(item),
                            );
                          },
                        ),
                        const SizedBox(height: MSizes.spaceBtwSections),

                        /// Popular Searches
                        Align(
                          alignment: AlignmentGeometry.centerLeft,
                          child: Text('Popular Searches'),
                        ),
                        const SizedBox(height: MSizes.spaceBtwItems),
                        ListView.separated(
                          itemCount: controller.popularItems.length,
                          shrinkWrap: true,
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 10),
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final item = controller.popularItems[index];
                            return MMenuCardHorizontal(
                              menuItem: item,
                              onTap: item.isOutOfStock
                                  ? null
                                  : () => controller.onItemTap(item),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

