import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';

class MCouponCode extends StatelessWidget {
  const MCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Coupon icon
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Icon(Iconsax.ticket_discount5, size: 28, color: MColors.primary),
          ),
          // Divider
          SizedBox(width: 8,),
          Container(width: 2, height: 24, color: Colors.grey.shade300),
          SizedBox(width: 8,),
          // Text input
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Coupon code (optional)',
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          // Apply button
          Container(
            margin: EdgeInsets.all(6),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: MColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                side: BorderSide.none,
              ),
              child: Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}