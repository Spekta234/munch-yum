import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

class RequiredBadge extends StatelessWidget {
  const RequiredBadge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        shape: BoxShape.rectangle,
        color: Colors.red.shade100,
      ),
      child: Text('Required',style: Theme.of(context).textTheme.labelSmall!.apply(color: MColors.primary),),
    );
  }
}