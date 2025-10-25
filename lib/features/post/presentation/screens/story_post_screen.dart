import 'package:app/core/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/icons.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/shared/widgets/image_loader.dart';
import '../widget/post_card.dart';

class StoryPostScreen extends StatelessWidget {
  const StoryPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    onTapCallback: () {},
                    label: "Create Story",
                    icon: const ImageLoader(
                      imagePath: AppIcons.gallery,
                      width: 24.0,
                      height: 24.0,
                    ),
                  ).expanded,
                  PostCard(
                    onTapCallback: () {},
                    label: "Type Text",
                    icon: const ImageLoader(
                      imagePath: AppIcons.gallery,
                      width: 24.0,
                      height: 24.0,
                    ),
                  ).expanded,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
