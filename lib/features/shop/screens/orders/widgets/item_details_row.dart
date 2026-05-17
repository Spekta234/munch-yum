import 'package:flutter/material.dart';

class MItemDetailsRow extends StatelessWidget {
  const MItemDetailsRow({
    super.key, required this.title, required this.price,
  });

  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,  style: Theme.of(context).textTheme.labelSmall),
        Text(price,  style: Theme.of(context).textTheme.labelLarge),
      ],
    );
  }
}