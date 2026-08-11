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
import '../search/search_screen.dart';

class MenuDetails extends StatelessWidget {
  const MenuDetails({super.key, required this.menuItem});

  final MenuItemModel menuItem;
  
  @override
  Widget build(BuildContext context) {
    final controller = MenuItemController.instance;
    final menuDetailsController = MenuDetailsController.instance;
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
                    MenuDetailsImage(imageUrl: menuItem.image, fit: BoxFit.cover, isNetworkImage: true,),
                    const SizedBox(height: MSizes.spaceBtwItems),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MMenuTitleText(title: menuItem.title),
                          const SizedBox(height: MSizes.sm),
                          MMenuPriceText(price: menuItem.hasDiscount == true && menuItem.isOutOfStock == false ? menuItem.discountPrice!.toStringAsFixed(0) : menuItem.price.toStringAsFixed(0),),
                          const SizedBox(height: MSizes.spaceBtwItems),
                          Text(menuItem.description),
                        ],
                      ),
                    ),
                    const SizedBox(height: MSizes.spaceBtwItems),
                    Divider(),
                    ///
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() => MMenuPriceText(price: (menuItem.price * menuDetailsController.quantity.value).toStringAsFixed(0), isLarge: true,)),
                          Obx(() => Row(
                            children: [
                              GestureDetector(
                                onTap: menuDetailsController.decrease,
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.grey.shade200,
                                  child: Icon(Icons.remove, color: Colors.black, size: 20),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                '${menuDetailsController.quantity.value}',
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: menuDetailsController.increase,
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: MColors.primary,
                                  child: Icon(Icons.add, color: Colors.white, size: 20),
                                ),
                              ),
                            ],
                          )),
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
                              Text('Put an extra', style: Theme.of(context).textTheme.headlineSmall,),
                              const SizedBox(height: 3,),
                              Text('to the delicious...', style: Theme.of(context).textTheme.headlineSmall,),
                            ],
                          ),

                          GestureDetector(
                            onTap: () => Get.to(() => SearchScreen()),
                            child: MLogoAvatar(image: MImages.search, showBorder: false, size: 22,),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: MSizes.spaceBtwItems),
                    Obx(
                        () {
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
                            itemBuilder: (_, index) => MMenuCardVertical(menuItem: items[index], onTap: () => Get.to(() => MenuDetails(menuItem: items[index])),),
                          );
                        }
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// Floating Cart button
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
              badgeContent: Text(
                '1',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: MColors.primary,
                shape: CircleBorder(),
                child: Icon(Iconsax.shopping_cart, color: Colors.white),
              ),
            ),
          ),
        ]
      ),
    );
  }
}

