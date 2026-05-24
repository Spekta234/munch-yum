import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';

class MContactInfo extends StatelessWidget {
  const MContactInfo({
    super.key, required this.child, required this.contact, required this.contactInfo, this.hasCopy = false,
  });

  final Widget child;
  final String contact;
  final String contactInfo;
  final bool hasCopy;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: MColors.shade
              ),
              child: child,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contact, style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w500),),
                SizedBox(height: 4),
                RichText(
                  text: TextSpan(
                    text: '$contactInfo ',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.black, fontWeight: FontWeight.w500, decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                )
              ],
            )
          ],
        ),
        if(hasCopy)
          IconButton(onPressed: (){}, icon: Icon(Iconsax.copy5, color: MColors.primary, size: 28,))
      ],
    );
  }
}
