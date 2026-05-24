import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:munch_yum/features/shop/controllers/home_controller.dart';

import '../../../../../common/widgets/avatar_bottomsheet/avatar_bottomsheet.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';

class MSettingsHeader extends StatelessWidget {
  const MSettingsHeader({super.key, required this.name, required this.phoneNumber});

  final String name;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
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
          SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hey, $name', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 2,),
                Text('$phoneNumber ', style: Theme.of(context).textTheme.labelSmall!.copyWith(color: MColors.darkerGrey),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
