import 'dart:io';

import 'package:app/core/extensions/context_extensions.dart';
import 'package:app/core/utils/file_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/config/icons.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/widgets/app_elevated_button.dart';
import '../../../../core/shared/widgets/image_loader.dart';

class StoryPostScreen extends StatefulWidget {
  const StoryPostScreen({super.key});

  @override
  State<StoryPostScreen> createState() => _StoryPostScreenState();
}

class _StoryPostScreenState extends State<StoryPostScreen> {
  File? imageFile;

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
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: AppSizes.sm,
                children: <Widget>[
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
                        width: 40,
                        height: 40,
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
                    ],
                  ),
                ],
              ),

              const SizedBox(height: AppSizes.md),
              ImageLoader(
                imagePath:
                    imageFile ??
                    "https://www.victoriassecret.com/p/504x672/png/zz/25/09/26/14/112696011885_OM_S.jpg",

                height: context.screenHeight * 0.6,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: AppSizes.lg,
          children: <Widget>[
            GestureDetector(
              onTap: () async {
                final File? file = await FilePickerUtils.pickFile();
                if (file != null) {
                  setState(() {
                    imageFile = file;
                  });
                }
              },
              child: const ImageLoader(
                imagePath: AppIcons.gallery,
                width: 32.0,
                height: 32.0,
                color: AppColors.black,
              ),
            ),
            AppElevatedButton(
              label: "Share",
              onPressed: () {
                context.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
