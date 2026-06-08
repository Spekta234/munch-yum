import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/common/texts/menu_title_text.dart';
import 'package:munch_yum/features/authentication/screens/login/widgets/logo_avatar.dart';
import 'package:munch_yum/utils/constants/sizes.dart';

import '../../../utils/constants/colors.dart';

class MBottomSheet extends StatelessWidget {
  const MBottomSheet({
    super.key,
    required this.title,
    required this.icon,
    required this.subtitle1,
    required this.subtitle2,
    required this.child,
    required this.onCancelTap,
    required this.onRemoveTap,
  });

  final String title;
  final IconData icon;
  final String subtitle1;
  final String subtitle2;
  final Widget child;
  final VoidCallback onCancelTap;
  final VoidCallback onRemoveTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: MSizes.md,
        bottom: 50,
        left: MSizes.md,
        right: MSizes.md,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              backgroundColor: MColors.secondary,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close),
              ),
            ),
          ),
          const SizedBox(height: MSizes.spaceBtwItems),
          MLogoAvatar(
            showBorder: false,
            size: 40,
            child: Icon(icon, size: 40, color: MColors.primary),
          ),
          const SizedBox(height: MSizes.spaceBtwItems),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  '$title ',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: MSizes.spaceBtwItems),
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: '$subtitle1 ',
                    style: Theme.of(context).textTheme.labelLarge,
                    children: [
                      WidgetSpan(child: child),
                      TextSpan(
                        text: '$subtitle2 ',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: MSizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onCancelTap,
              child: Text('Cancel'),
            ),
          ),

          const SizedBox(height: MSizes.spaceBtwItems),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: onRemoveTap,
              style: OutlinedButton.styleFrom(side: BorderSide.none, backgroundColor: MColors.grey),
              child: Text('Remove from cart'),
            ),
          ),
        ],
      ),
    );
  }
}
