import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/enums/enums.dart';
import 'm_ctgy_title_text.dart';

class MCtgyTitleTextWithIcon extends StatelessWidget {
  const MCtgyTitleTextWithIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = MColors.grey,
    this.textAlign = TextAlign.center,
    this.ctgyTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes ctgyTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Iconsax.reserve, color: iconColor, size: 18),
        SizedBox(width: 4),
        Flexible(
          child: MCtgyTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            ctgyTextSizes: ctgyTextSize,
          ),
        ),
        const SizedBox(width: MSizes.xs),
      ],
    );
  }
}
