import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_yum/features/shop/controllers/home_controller.dart';

import '../../../utils/constants/colors.dart';

class AvatarBottomSheet extends StatelessWidget {
  const AvatarBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance; 
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Close X button
          Align(
            alignment:  Alignment.topRight,
            child: CircleAvatar(
              backgroundColor: MColors.secondary,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close),
              ),
            ),
          ),

          // Title
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Set your Avatar',
                style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  'Select any avatar you love below',
                style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
          SizedBox(height: 16),

          // Avatar grid
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: controller.avatars.length,
            itemBuilder: (context, index) => Obx(
                () => GestureDetector(
                  onTap: () => controller.onAvatarSelected(controller.avatars[index]),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: controller.selectedAvatar.value == controller.avatars[index]
                            ? MColors.primary
                            : Colors.grey.shade300,
                        width: 2,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor:  Colors.transparent,
                      backgroundImage: AssetImage(controller.avatars[index]),
                    ),
                  ),
                ),
            ),
          ),
          SizedBox(height: 25),

          // Go to settings
          TextButton(
            onPressed: () {},
            child: Text(
              'Go to settings',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: MColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: MColors.primary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
