import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:munch_yum/common/layout/grid_layout.dart';
import 'package:munch_yum/common/menu/menu_card.dart';
import 'package:munch_yum/features/authentication/screens/login/widgets/heading_text.dart';
import 'package:munch_yum/features/shop/controllers/home_controller.dart';
import 'package:munch_yum/features/shop/controllers/offers_controller.dart';
import 'package:munch_yum/features/shop/models/menu_item_model.dart';
import 'package:munch_yum/features/shop/screens/offers/widgets/menu_card_offers.dart';
import 'package:munch_yum/utils/constants/image_strings.dart';
import 'package:munch_yum/utils/constants/sizes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/constants/colors.dart';
import '../menu_details/menu_details.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final offersController  = OffersController.instance;
    final controller = HomeController.instance;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.all(MSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Heading
              const MHeadingText(
                title: 'Offers',
                subtitle: 'Munch Yum gives you the best offers to your delicious delight',
                showGuestButton: false,
              ),
              const SizedBox(height: MSizes.spaceBtwItems),
              Text('Hot Deals! 🔥', style: Theme.of(context).textTheme.bodySmall!.apply(color: Colors.black)),
              const SizedBox(height: MSizes.sm),
              /// Banner
              Column(
                children: [
                  SizedBox(
                    height: MSizes.imageCarouselHeight,
                    child: PageView.builder(
                      controller: controller.bannerController,
                      onPageChanged: controller.onBannerPageChanged,
                      itemCount: controller.banners.length,
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: AssetImage(controller.banners[index]),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // ── Dot indicator ──

                  SmoothPageIndicator(
                    controller: controller.bannerController,
                    count: controller.banners.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: MColors.primary,
                      dotColor: Colors.pink.shade100,
                      dotHeight: 8,
                      dotWidth: 10,
                      expansionFactor: 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: MSizes.spaceBtwSections),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Latest Deals 🔥', style: Theme.of(context).textTheme.bodySmall!.apply(color: Colors.black)),
                  Text('Here are some hot deals for you', style: Theme.of(context).textTheme.labelSmall),
                  const SizedBox(height: MSizes.spaceBtwItems),
                  Obx(
                    () => ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: offersController.featuredItems.length,
                      separatorBuilder: (_, index) =>const SizedBox(height: MSizes.spaceBtwItems),
                      itemBuilder: (_, index) {
                        final item = offersController.featuredItems[index];
                        return MenuCardOffers(
                          isOutOfStock: item.isOutOfStock,
                          hasDiscount: item.hasDiscount,
                          title: item.title,
                          image: item.image,
                          price: item.price.toStringAsFixed(0),
                          isCurved: true,
                          onTap: item.isOutOfStock ? null : () => Get.to(() => MenuDetails(menuItem: item)),
                        );
                      }
                    ),
                  ),



                  const SizedBox(height: MSizes.spaceBtwSections,),
                  Text('More offers', style: Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.black),),
                  Text('Get discount on our available meals here', style: Theme.of(context).textTheme.labelSmall,),
                  const SizedBox(height: MSizes.spaceBtwItems),
                  Obx(
                    () => MGridLayout(
                      itemCount: offersController.moreOffers.length,
                      itemBuilder: (_, index) => MMenuCardVertical(menuItem: offersController.moreOffers[index]),
                    ),
                  ),

                ],
              ),

            ],
          ),
          ),
        ),
      ),
    );
  }
}
