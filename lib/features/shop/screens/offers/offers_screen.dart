import 'package:flutter/material.dart';
import 'package:munch_yum/features/authentication/screens/login/widgets/heading_text.dart';
import 'package:munch_yum/features/shop/controllers/home_controller.dart';
import 'package:munch_yum/features/shop/screens/offers/widgets/menu_card_offers.dart';
import 'package:munch_yum/utils/constants/image_strings.dart';
import 'package:munch_yum/utils/constants/sizes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/constants/colors.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  MenuCardOffers(
                    isOutOfStock: false,
                    hasDiscount: true,
                    title: '#LoveBox - ValentineBox',
                    image: MImages.valentineBox,
                    price: '14,999',
                    isCurved: true,
                  ),
                  const SizedBox(height: MSizes.spaceBtwItems),
                  MenuCardOffers(
                    isOutOfStock: true,
                    hasDiscount: true,
                    title: '#LoveBox - BirthdayBox',
                    image: MImages.birthdayBox,
                    price: '14,999', isCurved: false,
                  ),
                  const SizedBox(height: MSizes.spaceBtwItems),
                  MenuCardOffers(
                    isOutOfStock: true,
                    hasDiscount: true,
                    title: '#LoveBox - PartyBox',
                    image: MImages.partyBox,
                    price: '14,999',
                    isCurved: false,
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
