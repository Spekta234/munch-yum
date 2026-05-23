import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
class MLogoAvatar extends StatelessWidget {
  const MLogoAvatar({
    super.key,
    this.image,
    this.showLoader = false,
    this.showBorder = true,
    this.borderWidth = 2.0,
    this.size,
    this.child,
    this.innerRadius,
  });

  final String? image;
  final Widget? child;
  final bool showLoader;
  final bool showBorder;
  final double borderWidth;
  final double? size;
  final double? innerRadius;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final radius = size ?? screenHeight * 0.06;

    // ── What to show inside the circle ──
    final innerWidget = child ?? (image != null
        ? Image(image: AssetImage(image!))
        : const SizedBox());

    return Center(
      child: showLoader
          ? Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: radius * 2.5,
            height: radius * 2.5,
            child: CircularProgressIndicator(
              color: MColors.primary,
              strokeWidth: borderWidth,
            ),
          ),
          CircleAvatar(
            radius: innerRadius ?? radius,
            backgroundColor: MColors.secondary,
            child: innerWidget,
          ),
        ],
      )
          : Container(
        padding: showBorder ? EdgeInsets.all(borderWidth + 4) : EdgeInsets.zero,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: showBorder
              ? Border.all(color: MColors.primary, width: borderWidth)
              : null, // ← no border
        ),
        child: CircleAvatar(
          radius: radius,
          backgroundColor: Colors.red.shade100,
          child: innerWidget
        ),
      ),
    );
  }
}
