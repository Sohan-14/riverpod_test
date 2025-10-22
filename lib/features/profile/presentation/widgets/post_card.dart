import 'package:app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/config/icons.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/shared/widgets/image_loader.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.sm,
        vertical: AppSizes.sm,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey, width: 2.0),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppSizes.sm,
            children: <Widget>[
              const ClipOval(
                child: ImageLoader(
                  imagePath:
                      "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
                  width: 50,
                  height: 50,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Zahidul Islam Shohan",
                    style: context.txtTheme.bodyMedium,
                  ),
                  Text(
                    "1w",
                    style: context.txtTheme.bodyMedium,
                  ),
                ],
              ),

              const Spacer(),

              const ImageLoader(
                imagePath: AppIcons.menu,
                width: 24.0,
                height: 24.0,
              ),
            ],
          ),

          const SizedBox(
            height: AppSizes.md,
          ),

          const ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
            child: ImageLoader(
              imagePath:
                  "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
              width: double.infinity,
              height: 300,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.sm,
              vertical: AppSizes.sm,
            ),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
              ),
            ),
            child: Row(
              spacing: AppSizes.md,
              children: <Widget>[
                Row(
                  spacing: AppSizes.sm,
                  children: <Widget>[
                    const Icon(
                      Icons.favorite_outline,
                      size: 24.0,
                      color: AppColors.white,
                    ),
                    Text(
                      "48K",
                      style: context.txtTheme.bodyMedium?.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: AppSizes.sm,
                  children: <Widget>[
                    const Icon(
                      Icons.mode_comment_outlined,
                      size: 24.0,
                      color: AppColors.white,
                    ),
                    Text(
                      "8K",
                      style: context.txtTheme.bodyMedium?.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: AppSizes.sm,
                  children: <Widget>[
                    const Icon(
                      Icons.share,
                      size: 24.0,
                      color: AppColors.white,
                    ),
                    Text(
                      "12K",
                      style: context.txtTheme.bodyMedium?.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
