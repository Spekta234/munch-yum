import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

class MSummaryRow extends StatelessWidget {
  const MSummaryRow({
    super.key,
    required this.title,
    required this.amount,
  });

  final String title;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            amount,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: MColors.darkerGrey,
            ),
          ),
        ],
      ),
    );
  }
}
