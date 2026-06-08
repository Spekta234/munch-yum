import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/helpers/helper_function.dart';


class MFormDivider extends StatelessWidget {
  const MFormDivider({
    super.key,
    required this.dividerText
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: MColors.grey,
            thickness: 2,
            indent: 20,
            endIndent: 10,
          ),
        ),
        Text(
          dividerText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: MColors.grey,
            thickness: 2,
            indent: 10,
            endIndent: 20,
          ),
        ),
      ],
    );
  }
}