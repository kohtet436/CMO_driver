import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../values/assets_manager.dart';

class CircularProfile extends StatelessWidget {
  const CircularProfile({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.contain,
          ),
        ),
      ),
      progressIndicatorBuilder: (context, url, progress) => const SizedBox(
        width: 100,
        height: 100,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(ImageAssets.employeePhotoPlaceHolder),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
