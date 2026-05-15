import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

class MOrderStatusBadge extends StatelessWidget {
  const MOrderStatusBadge({
    super.key, required this.status,
  });

  final String status;

  // change color based on status
  Color get backgroundColor{
    switch (status) {
      case 'Payment Pending' : return MColors.pendingBackground;
      case 'Payment Successful' : return Colors.green.shade100;
      case 'Payment Failed' : return Colors.red.shade100;
      default: return MColors.lightGrey;
    }
  }

  Color get textColor{
    switch (status) {
      case 'Payment Pending' : return MColors.pendingForeground;
      case 'Payment Successful' : return MColors.success;
      case 'Payment Failed' : return MColors.error;
      default: return MColors.lightGrey;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(),
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        shape: BoxShape.rectangle,
        color: backgroundColor,
      ),
      child: Text(status, style: Theme
          .of(context)
          .textTheme
          .labelSmall!
          .apply(color: textColor),),
    );
  }
}
