import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/common/layout/grid_layout.dart';
import 'package:munch_yum/common/menu/menu_card.dart';
import 'package:munch_yum/common/styles/spacing_styles.dart';
import 'package:munch_yum/features/authentication/screens/location/location.dart';
import 'package:munch_yum/features/authentication/screens/login/widgets/logo_avatar.dart';
import 'package:munch_yum/features/shop/controllers/home_controller.dart';
import 'package:munch_yum/features/shop/screens/home/widgets/home_category.dart';
import 'package:munch_yum/features/shop/screens/home/widgets/home_header.dart';
import 'package:munch_yum/features/shop/screens/search/search_screen.dart';
import 'package:munch_yum/utils/constants/colors.dart';
import 'package:munch_yum/utils/constants/image_strings.dart';
import 'package:munch_yum/utils/constants/sizes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../personification/screens/support/support.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            /// Header 
            MHomeHeader(),
            const SizedBox(height: 2,),
            Expanded(
              child: SingleChildScrollView(
              child: Padding(padding: const EdgeInsets.only(top: 0, right: 13, left: 13, bottom: 2),
              child: Column(
                children: [
                  /// Order menu
                  GestureDetector(
                    onTap: () => Get.to(() => LocationScreen(showBackButton: true)),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        shape: BoxShape.rectangle,
                        color: MColors.secondary,
                      ),
                      child: Row(
                        children: [
                          MLogoAvatar(image: MImages.outlet, showBorder: false, size: 20,),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Ordering from:', style: Theme.of(context).textTheme.labelSmall!.apply(color: Colors.grey)),
                                    Icon(Icons.arrow_forward, size: 20, color: Colors.grey,)
                                  ],
                                ),
                                const SizedBox(height: 3),
                                Obx(() => Text(controller.user.value.selectedOutlet,  style: Theme.of(context).textTheme.labelMedium!.apply(color: Colors.black), overflow: TextOverflow.ellipsis,))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// Having issues?
                  Transform.translate(
                    offset: Offset(10, -10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => Get.to(SupportScreen(showBackButton: true)),
                        child: Text(
                          'Having issues?',
                          style: Theme.of(context).textTheme.labelSmall!.apply(
                            color: MColors.primary,
                            decoration: TextDecoration.underline,
                            decorationColor: MColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ),

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

                  /// Section header
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('How may we', style: Theme.of(context).textTheme.headlineSmall,),
                            const SizedBox(height: 3,),
                            Text('Delight you today?', style: Theme.of(context).textTheme.headlineSmall,),
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

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(alignment: Alignment.centerLeft,child: Text('Categories',  style: Theme.of(context).textTheme.bodyLarge)),
                        const SizedBox(height: MSizes.spaceBtwItems),
                        const HomeCategory(),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(alignment: Alignment.centerLeft, child: Text('Food', style: Theme.of(context).textTheme.bodyLarge,)),
                        const SizedBox(height: MSizes.spaceBtwItems),
                        MGridLayout(
                          itemCount: 8,
                          itemBuilder: (_, index) => MMenuCardVertical(),
                        ),
                        const SizedBox(height: MSizes.spaceBtwItems),
                        Align(alignment: Alignment.centerLeft, child: Text('Protein', style: Theme.of(context).textTheme.bodyLarge,)),
                        const SizedBox(height: MSizes.spaceBtwItems),
                        MGridLayout(
                          itemCount: 8,
                          itemBuilder: (_, index) => MMenuCardVertical(),
                        ),
                        const SizedBox(height: MSizes.spaceBtwItems),
                        Align(alignment: Alignment.centerLeft, child: Text('Pastry', style: Theme.of(context).textTheme.bodyLarge,)),
                        const SizedBox(height: MSizes.spaceBtwItems),
                        MGridLayout(
                          itemCount: 8,
                          itemBuilder: (_, index) => MMenuCardVertical(),
                        ),
                      ],
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
    );
  }
}

