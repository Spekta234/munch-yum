import 'package:flutter/material.dart';

class MAddressDateRow extends StatelessWidget {
  const MAddressDateRow({
    super.key, required this.address, required this.date,
  });

  final String address;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(child: Text(address, style: Theme.of(context).textTheme.labelSmall, overflow: TextOverflow.ellipsis,),),
        SizedBox(width: 10,),
        Text(date, style: Theme.of(context).textTheme.labelSmall, overflow: TextOverflow.ellipsis,)
      ],
    );
  }
}