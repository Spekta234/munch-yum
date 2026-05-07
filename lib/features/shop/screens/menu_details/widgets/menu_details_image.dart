import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';

class MenuDetailsImage extends StatelessWidget {
  const MenuDetailsImage({
    super.key, required this.imageUrl, this.fit, this.isNetworkImage = false,
  });

  final String imageUrl;
  final BoxFit? fit;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MSizes.imageCarouselHeight,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: isNetworkImage
            ? NetworkImage(imageUrl)
                :AssetImage(imageUrl) as ImageProvider,
            fit: fit,
          ),
        ),
      ),
    );
  }
}