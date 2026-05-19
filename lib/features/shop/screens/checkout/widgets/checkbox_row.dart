import 'package:flutter/material.dart';
import 'package:munch_yum/utils/constants/colors.dart';

import '../../../../../common/custom_shapes/checkbox/custom_checkbox.dart';
import '../../../../../utils/constants/sizes.dart';

class MCheckboxRow extends StatelessWidget {
  const MCheckboxRow({
    super.key, required this.title, required this.price, required this.isSelected, required this.onTap,
  });

  final String title;
  final String price;
  final bool isSelected;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          // Checkbox(
          //   value: isSelected,
          //   onChanged: (value) {},
          //   visualDensity: VisualDensity.compact,
          //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          // ),
          MCustomCheckbox(onTap: onTap, isSelected: isSelected),
          const SizedBox(width: 12),
          Text(title),
          Spacer(),
          if (price.isNotEmpty)
            Text(price, style: Theme.of(context).textTheme.bodySmall!.apply(color: MColors.darkerGrey),)
        ],
      ),
    );
  }
}
