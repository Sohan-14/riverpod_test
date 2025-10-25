import 'package:app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/sizes.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/widgets/app_text_field.dart';
import '../../../../core/shared/widgets/image_loader.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

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
              const SizedBox(
                height: AppSizes.spaceBetweenItems,
              ),

              AppTextField(
                labelText: "Search",
                controller: TextEditingController(),
              ),

              const SizedBox(
                height: AppSizes.spaceBetweenItems,
              ),

              ListView.separated(
                shrinkWrap: true,
                itemCount: 20,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, int index) {
                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => context.push(RoutePaths.oneToOneChat),
                    child: const ChatCard(),
                  );
                },
                separatorBuilder: (_, _) => const SizedBox(
                  height: AppSizes.md,
                ),
              ),

              Container(),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: AppSizes.sm,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: GestureDetector(
            onTap: () => context.push(
              RoutePaths.imageFullScreen,
              extra: <String, String>{
                "imagePath":
                    "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
              },
            ),
            child: const ImageLoader(
              imagePath:
                  "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
              width: 80,
              height: 60,
            ),
          ),
        ),
        Column(
          spacing: AppSizes.xs,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Rocky Parker",
              style: context.txtTheme.bodyLarge,
            ),
            Text(
              "You: Okay fine.  08:36 AM",
              style: context.txtTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }
}
