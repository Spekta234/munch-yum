import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class EnterAddressTextformField extends StatelessWidget {
  const EnterAddressTextformField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        TextFormField(
          maxLines: 3,
          decoration: InputDecoration(
              hintText: 'Enter your address, city or landmark',
              hintStyle: Theme
                  .of(context)
                  .textTheme
                  .labelLarge!
                  .apply(color: Colors.grey),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12)),
              contentPadding: EdgeInsets.all(MSizes.md),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: MColors.darkerGrey),
              )
          ),
        ),
        SizedBox(height: screenHeight * 0.27),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Set address'),
          ),
        ),
      ],
    );
  }
}