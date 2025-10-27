import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/sizes.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/widget_extensions.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/config/icons.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/widgets/image_loader.dart';
import '../widget/post_card.dart';

class FeedPostScreen extends StatelessWidget {
  const FeedPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.screenHorizontal,
        vertical: AppSizes.md,
      ),
      child: Column(
        children: <Widget>[
          Row(
            spacing: 8.0,
            children: <Widget>[
              PostCard(
                onTapCallback: () {
                  context.push(RoutePaths.postStory);
                },
                label: "Create Story",
                icon: const ImageLoader(
                  imagePath: AppIcons.gallery,
                  width: 24.0,
                  height: 24.0,
                ),
              ).expanded,
              PostCard(
                onTapCallback: () {
                  context.push(RoutePaths.createPostFeed);
                },
                label: "Create Post",
                icon: Text(
                  "Aa",
                  style: context.txtTheme.bodyMedium?.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ).expanded,
            ],
          ),
        ],
      ),
    );
  }
}
