import 'package:flutter/material.dart';

import '../../../utils/enums/enums.dart';

class MCtgyTitleText extends StatelessWidget {
  const MCtgyTitleText({
    super.key,
    this.color,
    required this.title,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
    this.ctgyTextSizes = TextSizes.small,
  });

  final Color? color;
  final String title;
  final int maxLines;
  final TextAlign? textAlign;
  final TextSizes ctgyTextSizes;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      // Check which brandSize is required and set that style.
      style:
          ctgyTextSizes == TextSizes.small
              ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
              : ctgyTextSizes == TextSizes.medium
              ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
              : ctgyTextSizes == TextSizes.large
              ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
              : Theme.of(context).textTheme.bodyMedium!.apply(color: color),
    );
  }
}
