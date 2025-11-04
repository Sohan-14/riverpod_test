import 'package:app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/sizes.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/widgets/image_loader.dart';

class GalleryProfileTab extends StatelessWidget {
  const GalleryProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSizes.md,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Wrap(
          spacing: 4.0, // Space between images
          runSpacing: 4.0, // Space between rows
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.start,
          children: List<ClipRRect>.generate(
            11, // Total images
            (int index) => ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: GestureDetector(
                onTap: () => context.push(
                  RoutePaths.imageFullScreen,
                  extra: <String, String>{
                    "imagePath":
                        "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
                  },
                ),
                child: ImageLoader(
                  imagePath:
                      "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
                  width: context.screenWidth * .42,
                  height: 120,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
