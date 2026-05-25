import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';

class MSettingsSections extends StatelessWidget {
  const MSettingsSections({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.showArrow = true,
    this.titleColor,
  });

  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final bool showArrow;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Row(
            children: [
              Icon(icon, color: MColors.primary,),
              const SizedBox(width: 10),
              Text(title, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, color: titleColor ?? Colors.black)),
            ],
          ),
          const Spacer(),
          if(showArrow)
          Icon(Icons.arrow_forward_ios_rounded, size: 18,),
        ],
      ),
    );
  }
}