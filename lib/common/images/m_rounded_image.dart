import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';


class MRoundedImage extends StatelessWidget {
  const MRoundedImage({
    super.key,
    this.width = 400,
    this.height = 200,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = MSizes.md,
    this.margin,
    // this.shape = BoxShape.rectangle,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;
  final EdgeInsetsGeometry? margin;
  // final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: margin,
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          // shape: shape,
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius:
          applyImageRadius
              ? BorderRadius.only(topLeft: Radius.circular(borderRadius), topRight: Radius.circular(borderRadius))
              : BorderRadius.only(bottomLeft: Radius.circular(borderRadius), topLeft: Radius.circular(borderRadius)),
          child: Image(
            fit: fit,
            image:
            isNetworkImage
                ? NetworkImage(imageUrl)
                : AssetImage(imageUrl) as ImageProvider,
          ),
        ),
      ),
    );
  }
}