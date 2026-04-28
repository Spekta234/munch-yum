import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_yum/navigation_menu.dart';

import '../../../../../utils/constants/colors.dart';

class MHeadingText extends StatelessWidget {
  const  MHeadingText({
    super.key, required this.title, this.name, required this.subtitle, required this.showGuestButton, this.onTap,
  });

  final String title;
  final String? name;
  final String subtitle;
  final bool showGuestButton;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(
              text: title,
              style: Theme.of(context).textTheme.headlineSmall,
              children: [
                TextSpan(
                  text: name,
                  style: Theme.of(context).textTheme.headlineSmall!.apply(color: MColors.primary),
                ),
              ],
            ),
          ),
          if (showGuestButton)
          TextButton(
            onPressed: () => Get.to(NavigationMenu()),
            child: Text(
              'View as guest',
              style: Theme.of(context).textTheme.labelSmall!.apply(
                color: MColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: MColors.primary,
              ),
            ),
          ),
        ],
      ),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.labelMedium!.apply(color: Colors.grey.shade800),
        ),
      ],
    );
  }
}
