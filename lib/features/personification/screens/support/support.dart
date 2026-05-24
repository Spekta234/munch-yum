import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/common/styles/spacing_styles.dart';
import 'package:munch_yum/features/authentication/screens/login/widgets/heading_text.dart';
import 'package:munch_yum/features/authentication/screens/login/widgets/logo_avatar.dart';
import 'package:munch_yum/features/personification/screens/settings/settings.dart';
import 'package:munch_yum/features/personification/screens/support/widgets/contact_info.dart';
import 'package:munch_yum/utils/constants/colors.dart';

import '../../../../utils/constants/sizes.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: MSpacingStyles.paddingWithAppBarHeight,
        child: Column(
          children: [
            MHeadingText(
              title: 'Support',
              subtitle: 'We are here to assist you any time. Reach out to us through any of our platform below',
              showGuestButton: false,
              hasSpace: true,
            ),
           Expanded(
               child: SingleChildScrollView(
                 child: Column(
                   children: [
                     SizedBox(height: screenHeight * 0.10),
                     const MLogoAvatar(
                       innerRadius: 10,
                       child: Icon(Iconsax.messages5, color: MColors.primary, size: 40,),
                     ),
                     SizedBox(height: screenHeight * 0.12),
                     MContactInfo(
                       contact: 'Whatsapp',
                       contactInfo: '+234 906 342 9394',
                       child: FaIcon(FontAwesomeIcons.whatsappSquare, size: 20,
                         color: Colors.green.shade900,),
                     ),
                     const SizedBox(height: MSizes.spaceBtwItems),
                     MContactInfo(
                       contact: 'Email',
                       contactInfo: 'customercare@munchyumonline.com',
                       child: Icon(Icons.mark_email_unread_rounded, size: 20, color: Colors.green.shade900,),
                     ),
                     const SizedBox(height: MSizes.spaceBtwItems),
                     MContactInfo(
                         contact: 'Phone number',
                         contactInfo: '+234 906 342 9394',
                         hasCopy: true,
                         child: Icon(Icons.phone_in_talk, size: 20, color: Colors.green.shade900,)
                     ),
                     const SizedBox(height: MSizes.spaceBtwItems),
                     MContactInfo(
                         contact: 'Phone number',
                         contactInfo: '+234 806 342 7994',
                         hasCopy: true,
                         child: Icon(Icons.phone_in_talk, size: 20, color: Colors.green.shade900,)
                     ),
                     SizedBox(height: screenHeight * 0.04),
                     SizedBox(
                       width: double.infinity,
                       child: Expanded(
                         child: ElevatedButton(
                           onPressed: () => Get.to(() => Settings()),
                           style: ElevatedButton.styleFrom(
                               backgroundColor: Colors.red.shade100,
                               foregroundColor: MColors.primary,
                               shape: RoundedRectangleBorder()
                           ),
                           child: Text('Go to Settings'),
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
           ),
          ],
        ),
      )
    );
  }
}
