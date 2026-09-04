import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/common/texts/menu_price_text.dart';
import 'package:munch_yum/common/texts/menu_title_text.dart';
import 'package:munch_yum/features/shop/controllers/menu_details_controller.dart';
import 'package:munch_yum/features/shop/controllers/menu_item_controller.dart';
import 'package:munch_yum/features/shop/models/menu_item_model.dart';
import 'package:munch_yum/features/shop/screens/menu_details/widgets/menu_details_image.dart';
import 'package:munch_yum/utils/constants/colors.dart';
import 'package:munch_yum/utils/constants/image_strings.dart';
import 'package:munch_yum/utils/constants/sizes.dart';
import 'package:munch_yum/utils/shimmers/menu_item_shimmer.dart';

import '../../../../common/custom_shapes/buttons/add_to_cart_button.dart';
import '../../../../common/layout/grid_layout.dart';
import '../../../../common/menu/menu_card.dart';
import '../../../authentication/screens/login/widgets/logo_avatar.dart';
import '../../controllers/cart_controller.dart';
import '../cart/cart_screen.dart';
import '../search/search_screen.dart';

// class MenuDetails extends StatelessWidget {
//   const MenuDetails({super.key, required this.menuItem});
//
//   final MenuItemModel menuItem;
//
//   @override
//   Widget build(BuildContext context) {
//     print('MENU DETAILS BUILD CALLED for ${menuItem.title}');
//     final controller = MenuItemController.instance;
//     return Scaffold(
//       body: Stack(
//         children: [
//           SafeArea(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(MSizes.sm),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     /// Back arrow
//                     Align(
//                       alignment: AlignmentGeometry.centerLeft,
//                       child: IconButton(
//                         onPressed: () => Get.back(),
//                         icon: Icon(Icons.arrow_back_ios_new),
//                         iconSize: 15,
//                       ),
//                     ),
//                     const SizedBox(height: MSizes.spaceBtwItems),
//
//                     /// Image
//                     MenuDetailsImage(imageUrl: menuItem.image, fit: BoxFit.cover, isNetworkImage: true,),
//                     const SizedBox(height: MSizes.spaceBtwItems),
//
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           MMenuTitleText(title: menuItem.title),
//                           const SizedBox(height: MSizes.sm),
//                           MMenuPriceText(price: menuItem.hasDiscount == true && menuItem.isOutOfStock == false ? menuItem.discountPrice!.toStringAsFixed(0) : menuItem.price.toStringAsFixed(0),),
//                           const SizedBox(height: MSizes.spaceBtwItems),
//                           Text(menuItem.description),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: MSizes.spaceBtwItems),
//                     Divider(),
//                     ///
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Obx(() => MMenuPriceText(price: menuItem.hasDiscount? (menuItem.discountPrice! * menuDetailsController.quantity.value).toStringAsFixed(0) : (menuItem.price * menuDetailsController.quantity.value).toStringAsFixed(0), isLarge: true,)),
//                           Obx(() => Row(
//                             children: [
//                               GestureDetector(
//                                 onTap: menuDetailsController.decrease,
//                                 child: CircleAvatar(
//                                   radius: 12,
//                                   backgroundColor: Colors.grey.shade200,
//                                   child: Icon(Icons.remove, color: Colors.black, size: 20),
//                                 ),
//                               ),
//                               const SizedBox(width: 10),
//                               Text(
//                                 '${menuDetailsController.quantity.value}',
//                                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                               ),
//                               const SizedBox(width: 10),
//                               GestureDetector(
//                                 onTap: menuDetailsController.increase,
//                                 child: CircleAvatar(
//                                   radius: 12,
//                                   backgroundColor: MColors.primary,
//                                   child: Icon(Icons.add, color: Colors.white, size: 20),
//                                 ),
//                               ),
//                             ],
//                           )),
//                         ],
//                       ),
//                     ),
//                     Divider(),
//                     const SizedBox(height: MSizes.spaceBtwSections),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('Put an extra', style: Theme.of(context).textTheme.headlineSmall,),
//                               const SizedBox(height: 3,),
//                               Text('to the delicious...', style: Theme.of(context).textTheme.headlineSmall,),
//                             ],
//                           ),
//
//                           GestureDetector(
//                             onTap: () => Get.to(() => SearchScreen()),
//                             child: MLogoAvatar(image: MImages.search, showBorder: false, size: 22,),
//                           ),
//                         ],
//                       ),
//                     ),
//
//                     const SizedBox(height: MSizes.spaceBtwItems),
//                     Obx(
//                         () {
//                           if (controller.isLoading.value) {
//                             return const MMenuItemShimmer();
//                           }
//                           final items = controller.getItemsByCategory(menuItem.category)
//                               .where((item) => item.id != menuItem.id)
//                               .toList();
//
//                           if (items.isEmpty) {
//                             return const Center(child: Text('No items available'));
//                           }
//                           return MGridLayout(
//
//                             itemCount: items.length,
//                             itemBuilder: (_, index) => MMenuCardVertical(
//                               menuItem: items[index],
//
//                               // BUG (found + fixed 24 Aug 2026): tapping items in "Put an extra" did nothing —
//                               // no error, no crash, Get.to() ran but MenuDetails.build() never fired.
//                               //
//                               // Root cause: GetX's Get.to() has `preventDuplicates: true` by default.
//                               // Since we were already ON a MenuDetails screen and navigating to ANOTHER
//                               // MenuDetails (same widget TYPE, no named routes), GetX silently treated it
//                               // as "already on this route" and skipped the push entirely — no error thrown.
//                               //
//                               // Confirmed via: Navigator.push() (plain Flutter, bypassing GetX) worked fine
//                               // from this same tap, proving the bug was GetX-specific, not a widget/gesture
//                               // issue. Also confirmed Home -> MenuDetails (different screen types) worked
//                               // fine with Get.to() — only broke on MenuDetails -> MenuDetails (recursive,
//                               // same type).
//                               //
//                               // Fix: pass preventDuplicates: false explicitly for this call, since we WANT
//                               // to allow pushing a new MenuDetails on top of an existing one.
//
//                               onTap: () => Get.to(
//                                     () => MenuDetails(menuItem: items[index]),
//                                 preventDuplicates: false,
//                               ),
//                             ),
//                           );
//                         }
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//
//           /// Floating Cart button
//           Positioned(
//             bottom: 200,
//             right: 16,
//             child: badges.Badge(
//               position: badges.BadgePosition.topEnd(top: -2, end: -2),
//               badgeStyle: badges.BadgeStyle(
//                 badgeColor: MColors.primary,
//                 padding: EdgeInsets.all(4),
//                 borderSide: BorderSide(color: Colors.white, width: 1.5),
//               ),
//               badgeContent: Text(
//                 '1',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 9,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               child: FloatingActionButton(
//                 onPressed: () {},
//                 backgroundColor: MColors.primary,
//                 shape: CircleBorder(),
//                 child: Icon(Iconsax.shopping_cart, color: Colors.white),
//               ),
//             ),
//           ),
//         ]
//       ),
//     );
//   }
// }
class MenuDetails extends StatelessWidget {
  const MenuDetails({super.key, required this.menuItem});

  final MenuItemModel menuItem;

  @override
  Widget build(BuildContext context) {
    final controller = MenuItemController.instance;
    // CHANGED: removed `final menuDetailsController = MenuDetailsController.instance;`
    // — no longer needed, CartController now drives quantity/price on this screen.
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(MSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Back arrow
                    Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(Icons.arrow_back_ios_new),
                        iconSize: 15,
                      ),
                    ),
                    const SizedBox(height: MSizes.spaceBtwItems),

                    /// Image
                    MenuDetailsImage(imageUrl: menuItem.image, fit: BoxFit.cover, isNetworkImage: true),
                    const SizedBox(height: MSizes.spaceBtwItems),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MMenuTitleText(title: menuItem.title),
                          const SizedBox(height: MSizes.sm),
                          MMenuPriceText(
                            price: menuItem.hasDiscount == true && menuItem.isOutOfStock == false
                                ? menuItem.discountPrice!.toStringAsFixed(0)
                                : menuItem.price.toStringAsFixed(0),
                          ),
                          const SizedBox(height: MSizes.spaceBtwItems),
                          Text(menuItem.description),
                        ],
                      ),
                    ),
                    const SizedBox(height: MSizes.spaceBtwItems),
                    Divider(),

                    // CHANGED: replaced the old Row (price tied to menuDetailsController.quantity,
                    // plus a custom local +/- stepper that never touched the real cart) with a
                    // price that reflects the real cart quantity + the shared AddToCartButton,
                    // which handles add/increase/decrease against CartController directly.
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() {
                            final qty = CartController.instance.getQuantity(menuItem.id);
                            final unitPrice = menuItem.hasDiscount ? menuItem.discountPrice! : menuItem.price;
                            final displayQty = qty > 0 ? qty : 1;
                            return MMenuPriceText(
                              price: (unitPrice * displayQty).toStringAsFixed(0),
                              isLarge: true,
                            );
                          }),
                          AddToCartButton(menuItem: menuItem, isSmall: true,),
                        ],
                      ),
                    ),

                    Divider(),
                    const SizedBox(height: MSizes.spaceBtwSections),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Put an extra', style: Theme.of(context).textTheme.headlineSmall),
                              const SizedBox(height: 3),
                              Text('to the delicious...', style: Theme.of(context).textTheme.headlineSmall),
                            ],
                          ),
                          GestureDetector(
                            onTap: () => Get.to(() => SearchScreen()),
                            child: MLogoAvatar(image: MImages.search, showBorder: false, size: 22),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: MSizes.spaceBtwItems),
                    Obx(() {
                      if (controller.isLoading.value) {
                        return const MMenuItemShimmer();
                      }
                      final items = controller.getItemsByCategory(menuItem.category)
                          .where((item) => item.id != menuItem.id)
                          .toList();

                      if (items.isEmpty) {
                        return const Center(child: Text('No items available'));
                      }
                      return MGridLayout(
                        itemCount: items.length,
                        itemBuilder: (_, index) => MMenuCardVertical(
                          menuItem: items[index],
                          onTap: () => Get.to(
                                () => MenuDetails(menuItem: items[index]),
                            preventDuplicates: false,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),

          /// Floating Cart button
          // CHANGED: onPressed now navigates to CartScreen (its actual job here);
          // badge is now Obx()-wrapped and shows the real cart item count.
          Positioned(
            bottom: 200,
            right: 16,
            child: badges.Badge(
              position: badges.BadgePosition.topEnd(top: -2, end: -2),
              badgeStyle: badges.BadgeStyle(
                badgeColor: MColors.primary,
                padding: EdgeInsets.all(4),
                borderSide: BorderSide(color: Colors.white, width: 1.5),
              ),
              badgeContent: Obx(() => Text(
                '${CartController.instance.noOfCartItems.value}',
                style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
              )),
              child: FloatingActionButton(
                onPressed: () => Get.to(() => CartScreen()),
                backgroundColor: MColors.primary,
                shape: CircleBorder(),
                child: Icon(Iconsax.shopping_cart, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

