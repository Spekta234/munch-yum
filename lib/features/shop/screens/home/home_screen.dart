import 'package:flutter/material.dart';
import 'package:munch_yum/common/styles/spacing_styles.dart';
import 'package:munch_yum/utils/constants/colors.dart';
import 'package:munch_yum/utils/constants/image_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 27,
                  backgroundImage: AssetImage(MImages.chickenAvatar),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Good afternoon , Okey.', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(height: 2,),
                        Text('It is time for lunch - Taste the difference!', style: Theme.of(context).textTheme.labelSmall!.copyWith(color: MColors.darkerGrey),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
