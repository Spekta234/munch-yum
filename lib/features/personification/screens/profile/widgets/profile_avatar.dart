import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/features/shop/controllers/home_controller.dart';
import 'package:munch_yum/utils/constants/colors.dart';
import 'package:munch_yum/utils/constants/sizes.dart';

import '../../../../../common/widgets/avatar_bottomsheet/avatar_bottomsheet.dart';
import '../../../../../utils/constants/image_strings.dart';

class MProfileAvatar extends StatelessWidget {
  const MProfileAvatar({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context){
    final controller = HomeController.instance;
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    showDragHandle: false,
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) => const AvatarBottomSheet(),
                  );
                },
                child: Obx(
                      () => CircleAvatar(
                    radius: 27,
                    backgroundImage: controller.selectedAvatar.value.isEmpty
                        ? AssetImage(MImages.chickenAvatar)
                        : AssetImage(controller.selectedAvatar.value),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 5,
                child: Icon(
                  Iconsax.camera5,
                  size: 15,
                  color: MColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: MSizes.spaceBtwSections),
          Text('Hey, $name', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}