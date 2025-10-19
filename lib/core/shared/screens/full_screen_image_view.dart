import 'dart:io';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import '../../utils/detect_image_type.dart';

class FullScreenImageScreen extends StatelessWidget {
  final dynamic imagePath;
  const FullScreenImageScreen({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: PhotoView(
          imageProvider: switch (DetectImageType.detectImageType(imagePath)) {
            ImageType.asset => AssetImage(imagePath as String),
            ImageType.network => NetworkImage(imagePath as String),
            ImageType.svgAsset => null,
            ImageType.file => FileImage(imagePath as File),
          },
          backgroundDecoration: const BoxDecoration(color: Colors.black),
          minScale: PhotoViewComputedScale.contained * 1,
          maxScale: PhotoViewComputedScale.covered * 3,
          enableRotation: true,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}
