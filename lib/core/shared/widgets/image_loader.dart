import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../utils/app_logger.dart';

enum ImageType {
  asset,
  network,
  svgAsset,
  file,
}

class ImageLoader extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  final Alignment alignment;
  final Widget? errorWidget;
  final Widget? loadingWidget;

  const ImageLoader({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.fit,
    this.color,
    this.alignment = Alignment.center,
    this.errorWidget,
    this.loadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    final ImageType imageType = _detectImageType(imagePath);

    switch (imageType) {
      case ImageType.asset:
        return _buildAssetImage();
      case ImageType.network:
        return _buildNetworkImage();
      case ImageType.svgAsset:
        return _buildSvgImage();
      case ImageType.file:
        return _buildFileImage();
    }
  }

  // Detect image type based on file extension
  ImageType _detectImageType(String imagePath) {
    // Check if the imagePath contains 'http' or 'https' (network image)
    if (imagePath.startsWith('http://') || imagePath.startsWith('https://')) {
      return ImageType.network;
    }

    // Check if the imagePath ends with .svg (SVG asset image)
    if (imagePath.endsWith('.svg')) {
      return ImageType.svgAsset;
    }

    // Check if the imagePath represents a local file (local file image)
    if (imagePath.startsWith('file://')) {
      return ImageType.file;
    }

    // If it's not a network image, SVG, or file, assume it's a local asset image
    return ImageType.asset;
  }

  // Method to build an asset image
  Widget _buildAssetImage() {
    return Image.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      color: color,
      alignment: alignment,
      frameBuilder:
          (
            BuildContext context,
            Widget child,
            int? frame,
            bool wasSynchronouslyLoaded,
          ) {
            if (wasSynchronouslyLoaded) {
              // Return the image if it's already loaded
              return child;
            }
            // Show a loading indicator until the image is fully loaded
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: frame == null
                  ? loadingWidget ??
                        const Center(child: CircularProgressIndicator())
                  : child,
            );
          },
      errorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
            AppLogger().e("Loading asset image Error", error: error);
            return errorWidget ??
                const Center(child: Icon(Icons.error, color: Colors.red));
          },
    );
  }

  // Method to build a network image with caching
  Widget _buildNetworkImage() {
    return CachedNetworkImage(
      imageUrl: imagePath,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      color: color,
      alignment: alignment,
      placeholder: (BuildContext context, String url) {
        // Use custom loading widget if provided, or default loading indicator
        return loadingWidget ??
            const Center(child: CircularProgressIndicator());
      },
      errorWidget: (BuildContext context, String url, Object error) {
        // Use custom error widget if provided, or default error icon
        AppLogger().e("Loading asset network Error", error: error);
        return errorWidget ??
            const Center(child: Icon(Icons.error, color: Colors.red));
      },
    );
  }

  // Method to build an SVG image
  Widget _buildSvgImage() {
    return SvgPicture.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcATop)
          : null,
      alignment: alignment,
      placeholderBuilder: (BuildContext context) {
        // Provide a placeholder while the SVG is loading
        return loadingWidget ??
            const Center(child: CircularProgressIndicator());
      },
      errorBuilder:
          (BuildContext context, Object error, StackTrace stackTrace) {
            AppLogger().e("Loading svg asset image Error", error: error);
            return errorWidget ??
                const Center(child: Icon(Icons.error, color: Colors.red));
          },
    );
  }

  // Method to build a file image
  Widget _buildFileImage() {
    final File file = File(imagePath.replaceFirst('file://', ''));

    // Ensure the file exists before displaying it
    if (!file.existsSync()) {
      return errorWidget ??
          const Center(child: Icon(Icons.error, color: Colors.red));
    }

    return Image.file(
      file,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      color: color,
      alignment: alignment,
      errorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
            AppLogger().e("Loading file image Error", error: error);
            return errorWidget ??
                const Center(child: Icon(Icons.error, color: Colors.red));
          },
    );
  }
}
