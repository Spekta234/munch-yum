import 'package:flutter/material.dart';

import '../../../../../common/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class PaymentOption extends StatelessWidget {
  const PaymentOption({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.logoAsset,
    this.icon, this.isTransfer = false,
  }) : assert(logoAsset != null || icon != null, 'Provide either logoAsset or icon'); // CHANGED: catches a mistake at compile-time-adjacent (runtime assert) instead of silently rendering nothing

  final String? logoAsset;
  final IconData? icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isTransfer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MRoundedContainer(
        padding: const EdgeInsets.all(MSizes.md),
        showBorder: true,
        width: double.infinity,
        backgroundColor: isSelected ? MColors.primary.withOpacity(0.1) : Colors.transparent,
        borderColor: isSelected ? MColors.primary : MColors.grey,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(shape: BoxShape.circle, color: isTransfer ? MColors.primary : Colors.transparent),
              child: logoAsset != null
                  ? Image.asset(logoAsset!, width: 20, height: 20, fit: BoxFit.cover)
                  : Icon(icon, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: isSelected ? MColors.primary : Colors.transparent,
                border: Border.all(color: isSelected ? MColors.primary : Colors.grey, width: 1.5),
                shape: BoxShape.circle,
              ),
              child: Icon(isSelected ? Icons.check : null, color: Colors.white, size: 16),
            ),
          ],
        ),
      ),
    );
  }
}