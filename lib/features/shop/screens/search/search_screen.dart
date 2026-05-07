import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/common/custom_shapes/containers/rounded_container.dart';
import 'package:munch_yum/common/images/m_rounded_image.dart';
import 'package:munch_yum/common/widgets/appbar/appbar.dart';
import 'package:munch_yum/utils/constants/colors.dart';
import 'package:munch_yum/utils/constants/image_strings.dart';
import 'package:munch_yum/utils/constants/sizes.dart';

import '../../../../common/menu/horizontal_menu_card.dart';
import '../../../../common/texts/menu_price_text.dart';
import '../../../../common/texts/menu_title_text.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall!.apply(color: Colors.black),
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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Recent Search'),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Clear search history',
                        style: Theme.of(context).textTheme.labelSmall!.apply(
                          color: MColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor: MColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                child: Column(
                  children: [
                    /// Recent Searches
                    ListView.separated(
                      itemCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => SizedBox(height: 10),
                      itemBuilder: (context, index) => MMenuCardHorizontal(),
                    ),
                    const SizedBox(height: MSizes.spaceBtwSections,),

                    /// Popular Searches
                    Align(alignment: AlignmentGeometry.centerLeft, child: Text('Popular Searches')),
                    const SizedBox(height: MSizes.spaceBtwItems,),
                    ListView.separated(
                      itemCount: 2,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => SizedBox(height: 10),
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => MMenuCardHorizontal(),
                    ),
                  ],
                ),
              ),
              ),
            ],

          ),
        ),
      ),
    );
  }
}

