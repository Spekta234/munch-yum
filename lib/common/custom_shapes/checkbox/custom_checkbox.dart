import 'package:flutter/material.dart';

class MCustomCheckbox extends StatelessWidget {
  const MCustomCheckbox({
    super.key,
    required this.onTap,
    required this.isSelected,
  });

  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: isSelected ? Colors.green.shade900 : Colors.transparent,
          border: Border.all(
            color: isSelected ? Colors.green.shade900 : Colors.grey,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(
          isSelected ? Icons.check : Icons.remove,
          color: isSelected ? Colors.white : Colors.grey,
          size: 16,
        ),
      ),
    );
  }
}
