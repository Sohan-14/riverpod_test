import 'package:app/core/extensions/context_extensions.dart';
import 'package:app/core/shared/widgets/app_elevated_button.dart';
import 'package:app/core/shared/widgets/app_text_field.dart';
import 'package:app/core/utils/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/widgets/image_loader.dart';

class StoryViewScreen extends StatelessWidget {
  const StoryViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: AppSizes.sm,
            children: <Widget>[
              IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(
                  Icons.arrow_back_ios_sharp,
                  size: 18.0,
                  color: AppColors.black,
                ),
              ),
              ClipOval(
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
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
              Text(
                "Rocky Parker",
                style: context.txtTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: ImageLoader(
                  imagePath:
                      "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
                  width: context.screenWidth,
                  height: context.screenHeight * .7,
                ),
              ),

              const SizedBox(
                height: AppSizes.md,
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: AppSizes.sm,
                  children: <Widget>[
                    SizedBox(
                      width: context.screenWidth * .5,
                      child: AppTextField(
                        controller: TextEditingController(),
                        labelText: "Reply",
                      ),
                    ),

                    GestureDetector(
                      onTap: () => Toast.showSuccess("❤️"),
                      child: Text(
                        "❤️",
                        style: context.txtTheme.titleLarge,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Toast.showSuccess("😀"),
                      child: Text(
                        "😀",
                        style: context.txtTheme.titleLarge,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Toast.showSuccess("🥺"),
                      child: Text(
                        "🥺",
                        style: context.txtTheme.titleLarge,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Toast.showSuccess("😡"),
                      child: Text(
                        "😡",
                        style: context.txtTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: AppSizes.spaceBetweenItems,
              ),

              AppElevatedButton(
                label: "Sent",
                onPressed: () {
                  context.pop();
                },
              ),
              const SizedBox(
                height: AppSizes.spaceBetweenItems,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
