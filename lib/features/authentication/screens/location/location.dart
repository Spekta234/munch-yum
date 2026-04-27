import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:munch_yum/common/styles/spacing_styles.dart';
import 'package:munch_yum/features/authentication/screens/login/widgets/heading_text.dart';
import 'package:munch_yum/features/authentication/screens/login/widgets/logo_avatar.dart';
import 'package:munch_yum/utils/constants/colors.dart';
import 'package:munch_yum/utils/constants/image_strings.dart';


class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: MSpacingStyles.paddingWithAppBarHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -- header --
            const MHeadingText(
              title: 'Enter Location ', subtitle: 'Kindly choose a Munch Yum outlet near you.', showGuestButton: false,
            ),
            SizedBox(height: screenHeight * 0.10),

            // -- logo --
            const MLogoAvatar(image: MImages.location, showBorder: false, size: 35,),
            SizedBox(height: screenHeight * 0.06),

            // -- Dropdown fields --
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// State
                Text('State'),
                const SizedBox(height: 6),
                DropdownButtonFormField<String>(
                  key: UniqueKey(),
                  value: null,
                  icon: Icon(Icons.keyboard_arrow_down_outlined, color: Colors.grey,),
                  decoration: InputDecoration(
                    hintText: 'Select your state',
                    hintStyle: Theme.of(context).textTheme.labelSmall!.apply(color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 28,),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(28)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  items: ['Lagos', 'Abuja', 'Enugu', 'Port Harcourt']
                      .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  )).toList(),
                  onChanged: (value) {},

                ),
                SizedBox(height: screenHeight * 0.02),

                /// City
                Text('City'),
                const SizedBox(height: 6),
                DropdownButtonFormField<String>(
                  key: UniqueKey(),
                  value: null,
                  icon: Icon(Icons.keyboard_arrow_down_outlined, color: Colors.grey,),
                  decoration: InputDecoration(
                    hintText: 'Select your city',
                    hintStyle: Theme.of(context).textTheme.labelSmall!.apply(color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 28,),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(28)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  items: ['Enugu', 'Lekki', 'Ikeja']
                      .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  )).toList(),
                  onChanged: (value) {},

                ),
                SizedBox(height: screenHeight * 0.02),

                /// Outlet
                Text('Outlet'),
                const SizedBox(height: 6),
                DropdownButtonFormField<String>(
                  isExpanded: true,
                  key: UniqueKey(),
                  value: null,
                  icon: Icon(Icons.keyboard_arrow_down_outlined, color: Colors.grey,),
                  decoration: InputDecoration(
                    hintText: 'Select outlet',
                    hintStyle: Theme.of(context).textTheme.labelSmall!.apply(color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 28,),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(28)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  items: ['Crunchies Fried Chicken 262 Agbani Road, Enugu', 'Lekki', 'Ikeja']
                      .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  )).toList(),
                  onChanged: (value) {},

                ),
                SizedBox(height: screenHeight * 0.02),

                /// Set location button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Set location',
                      style: Theme.of(context).textTheme.bodySmall!.apply(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.17),

                /// Contact Support
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: 'Contact support',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: MColors.primary,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        decorationColor: MColors.primary,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ),
                ),

              ],
            )


          ],
        ),
        ),
      ),
    );
  }
}
