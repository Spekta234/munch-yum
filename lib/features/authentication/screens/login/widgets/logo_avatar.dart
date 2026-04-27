import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
class MLogoAvatar extends StatelessWidget {
  const MLogoAvatar({
    super.key,
    required this.image,
    this.showLoader = false,
    this.showBorder = true,
    this.borderWidth = 2.0,
    this.size,
  });

  final String image;
  final bool showLoader;
  final bool showBorder;
  final double borderWidth;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final radius = size ?? screenHeight * 0.06;

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
            radius: radius,
            backgroundColor: MColors.secondary,
            child: Image(image: AssetImage(image)),
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
          backgroundColor: MColors.secondary,
          child: Image(image: AssetImage(image)),
        ),
      ),
    );
  }
}
