import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

class LoyaltyCheckboxRow extends StatelessWidget {
  const LoyaltyCheckboxRow({
    super.key, required this.title, required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: Colors.green.shade900,
              borderRadius: BorderRadius.circular(MSizes.xs),
            ),
            child: Icon(Icons.check, color: Colors.white, size: 10),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text.rich(
            softWrap: true,
            TextSpan(
              children: [
                TextSpan(
                  text: '$title ',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: '- $description',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}