import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/features/personification/controllers/profile_controller.dart';
import 'package:munch_yum/features/shop/controllers/home_controller.dart';
import 'package:munch_yum/utils/constants/colors.dart';
import 'package:munch_yum/utils/constants/sizes.dart';

import '../../../../../common/widgets/avatar_bottomsheet/avatar_bottomsheet.dart';
import '../../../../../utils/constants/image_strings.dart';

class MProfileAvatar extends StatelessWidget {
  const MProfileAvatar({
    super.key,
    required this.name,
    required this.level,
  });

  final String name;
  final String level;

  @override
  Widget build(BuildContext context){
    final controller = ProfileController.instance;
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
          const SizedBox(height: MSizes.sm),
          Text(name, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: MSizes.spaceBtwItems),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                width: 20,
                height: 20,
                image: AssetImage(MImages.lb),
              ),
              const SizedBox(width: 4),
              Text(
                level,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: MColors.darkerGrey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}