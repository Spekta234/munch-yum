import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:munch_yum/common/styles/spacing_styles.dart';
import 'package:munch_yum/features/authentication/screens/login/widgets/heading_text.dart';
import 'package:munch_yum/features/authentication/screens/login/widgets/logo_avatar.dart';
import 'package:munch_yum/features/personification/screens/settings/settings.dart';
import 'package:munch_yum/features/personification/screens/support/widgets/contact_info.dart';
import 'package:munch_yum/utils/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/navigation_helpers.dart';
import '../../../../utils/snackbar/snack_bar.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key, this.showBackButton = false});

  final bool showBackButton;

  Future<void> _launchEmail() async {
    final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'okechukwuonoh49@gmail.com'
    );

    if (await launchUrl (emailLaunchUri)) {
      MSnackBar.customToast(message: 'redirecting....');
    } else {
      MSnackBar.warningToast(message: 'Could not redirect to email host');
    }

  }

  Future<void> _copyToClipboard(BuildContext context, String textToCopy) async {
    await Clipboard.setData(
      ClipboardData(text: textToCopy),
    );

    if (context.mounted) {
      MSnackBar.customToast(message: 'Copied to Clipboard!');
    }
  }
  
  void _launchWhatsapp({
    required BuildContext context,
    required String phoneNumber,
    required String message,
  }) async {
    final cleanPhone = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');

    final Uri whatsappUri = Uri.parse(
      'https://wa.me{Uri.encodedComponent(message)}',
    );

    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    } else {
      if (context.mounted) {
        MSnackBar.customToast(message: 'Could not open Whatsapp, make sure its installed in your device');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: MSpacingStyles.paddingWithAppBarHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -- header --
            if (showBackButton)
              SizedBox(
                height: 20,
                width: 20,
                child: IconButton(
                  onPressed: ()  => mBack(),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  icon: Icon(Icons.arrow_back_ios_new, size: 24, color: Colors.black),
                ),
              ),
            const SizedBox(height: MSizes.md),
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
                       onTap: () => _launchWhatsapp(
                         context: context,
                         phoneNumber: '+234 810 986 5251',
                         message: 'Hello MunchYum Manager! I need help with.... ',),
                       contact: 'Whatsapp',
                       contactInfo: '+234 906 342 9394',
                       child: FaIcon(FontAwesomeIcons.whatsappSquare, size: 20,
                         color: Colors.green.shade900,),
                     ),
                     const SizedBox(height: MSizes.spaceBtwItems),
                     MContactInfo(
                       onTap: _launchEmail,
                       contact: 'Email',
                       contactInfo: 'customercare@munchyumonline.com',
                       child: Icon(Icons.mark_email_unread_rounded, size: 20, color: Colors.green.shade900,),
                     ),
                     const SizedBox(height: MSizes.spaceBtwItems),
                     MContactInfo(
                         onTap: () => _copyToClipboard(context, '+234 906 342 9394'),
                         contact: 'Phone number',
                         contactInfo: '+234 906 342 9394',
                         hasCopy: true,
                         child: Icon(Icons.phone_in_talk, size: 20, color: Colors.green.shade900,)
                     ),
                     const SizedBox(height: MSizes.spaceBtwItems),
                     MContactInfo(
                         onTap: () => _copyToClipboard(context, '+234 806 342 7994'),
                         contact: 'Phone number',
                         contactInfo: '+234 806 342 7994',
                         hasCopy: true,
                         child: Icon(Icons.phone_in_talk, size: 20, color: Colors.green.shade900,)
                     ),
                     SizedBox(height: screenHeight * 0.04),
                     SizedBox(
                       width: double.infinity,
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
