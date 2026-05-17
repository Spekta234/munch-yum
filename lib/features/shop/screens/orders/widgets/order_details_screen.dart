import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';

class MOrderDetailsRow extends StatelessWidget {
  const MOrderDetailsRow({
    super.key, required this.label, required this.value,
  });

  final String label;
  final String value;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelSmall,),
        SizedBox(width: MSizes.spaceBtwSections * 2,),
        Flexible(child: Text(value, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500, color: Colors.black),))
      ],
    );
  }
}