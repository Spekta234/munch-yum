import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_yum/common/widgets/avatar_bottomsheet/avatar_bottomsheet.dart';
import 'package:munch_yum/features/shop/controllers/home_controller.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';


class MHomeHeader extends StatelessWidget {
  const MHomeHeader({
    super.key, required this.name,
  });

  final String name;


  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;
    final hour = DateTime.now().hour;
    final greeting = hour < 12 ? 'Good morning' : hour < 17 ? 'Good afternoon' : 'Good evening';
    final mealTime =  hour < 12 ? 'It is time for breakfast' : hour < 17 ? 'It is time for lunch' : 'It is time for dinner';

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
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
                Text('$greeting, $name.', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 2,),
                Text('$mealTime - Taste the difference!', style: Theme.of(context).textTheme.labelSmall!.copyWith(color: MColors.darkerGrey),)
              ],
            ),
          )
        ],
      ),
    );
  }
}