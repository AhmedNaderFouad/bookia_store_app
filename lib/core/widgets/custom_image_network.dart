import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomImageNetwork extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;

  const CustomImageNetwork({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      fit: BoxFit.cover,
      imageUrl: imageUrl,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: Skeletonizer(
          child: Container(height: height, width: width, color: Colors.grey),
        ),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
