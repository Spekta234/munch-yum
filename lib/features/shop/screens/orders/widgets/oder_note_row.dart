import 'package:flutter/material.dart';


class MOrderNoteRow extends StatelessWidget {
  const MOrderNoteRow({
    super.key, required this.label, required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(fontSize: 16, height: 1.5), // Applies to the whole line
        children: [
          TextSpan(text: label, style: Theme.of(context).textTheme.labelSmall),
          TextSpan(text: value,  style: Theme.of(context).textTheme.labelSmall),
        ],
      ),
    );
  }
}