import 'package:app/core/extensions/context_extensions.dart';
import 'package:app/core/shared/widgets/app_elevated_button.dart';
import 'package:app/core/utils/bottom_sheet/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/config/icons.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/widgets/app_text_field.dart';
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

              GestureDetector(
                onTap: () {
                  CustomBottomSheet.show<ReportSheet>(
                    context: context,
                    height: context.screenHeight * 0.5,
                    child: const ReportSheet(),
                  );
                },
                child: const ImageLoader(
                  imagePath: AppIcons.menu,
                  width: 24.0,
                  height: 24.0,
                ),
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
                  "https://www.victoriassecret.com/p/504x672/png/zz/25/09/26/14/112696011885_OM_S.jpg",
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
                GestureDetector(
                  onTap: () {
                    CustomBottomSheet.show<CommentSheet>(
                      context: context,
                      height: context.screenHeight * 0.8,
                      child: const CommentSheet(),
                    );
                  },
                  child: Row(
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
                ),
                GestureDetector(
                  onTap: () {
                    CustomBottomSheet.show<ShareSheet>(
                      context: context,
                      height: context.screenHeight * 0.8,
                      child: const ShareSheet(),
                    );
                  },
                  child: Row(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReportSheet extends StatefulWidget {
  const ReportSheet({
    super.key,
  });

  @override
  State<ReportSheet> createState() => _ReportSheetState();
}

class _ReportSheetState extends State<ReportSheet> {
  int selectedItem = -1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Report Post", style: context.txtTheme.titleMedium),
          const SizedBox(height: AppSizes.spaceBetweenItems),
          const Divider(color: AppColors.grey, thickness: 1.0),
          ListTile(
            leading: Text(
              "1",
              style: context.txtTheme.bodyMedium,
            ),
            title: const Text("Spam or misleading content"),
            trailing: Checkbox(
              value: selectedItem == 1,
              onChanged: (bool? value) {
                if (value != null && value) {
                  setState(() {
                    selectedItem = selectedItem == 1 ? -1 : 1;
                  });
                }
              },
            ),
            onTap: () {
              setState(() {
                selectedItem = selectedItem == 1 ? -1 : 1;
              });
            },
          ),
          ListTile(
            leading: Text(
              "2",
              style: context.txtTheme.bodyMedium,
            ),
            title: const Text("Hate speech or harassment"),
            trailing: Checkbox(
              value: selectedItem == 2,
              onChanged: (bool? value) {
                if (value != null && value) {
                  setState(() {
                    selectedItem = selectedItem == 2 ? -2 : 2;
                  });
                }
              },
            ),
            onTap: () {
              setState(() {
                selectedItem = selectedItem == 2 ? -2 : 2;
              });
            },
          ),
          ListTile(
            leading: Text(
              "3",
              style: context.txtTheme.bodyMedium,
            ),
            title: const Text("Inappropriate or explicit content"),
            trailing: Checkbox(
              value: selectedItem == 3,
              onChanged: (bool? value) {
                if (value != null && value) {
                  setState(() {
                    selectedItem = selectedItem == 3 ? -3 : 3;
                  });
                }
              },
            ),
            onTap: () {
              setState(() {
                selectedItem = selectedItem == 3 ? -3 : 3;
              });
            },
          ),
          ListTile(
            leading: Text(
              "4",
              style: context.txtTheme.bodyMedium,
            ),
            title: const Text("False information or fake news"),
            trailing: Checkbox(
              value: selectedItem == 4,
              onChanged: (bool? value) {
                if (value != null && value) {
                  setState(() {
                    selectedItem = selectedItem == 4 ? -4 : 4;
                  });
                }
              },
            ),
            onTap: () {
              setState(() {
                selectedItem = selectedItem == 4 ? -4 : 4;
              });
            },
          ),
          ListTile(
            leading: Text(
              "5",
              style: context.txtTheme.bodyMedium,
            ),
            title: const Text("Impersonation or copyright violation"),
            trailing: Checkbox(
              value: selectedItem == 5,
              onChanged: (bool? value) {
                if (value != null && value) {
                  setState(() {
                    selectedItem = selectedItem == 5 ? -5 : 5;
                  });
                }
              },
            ),
            onTap: () {
              setState(() {
                selectedItem = selectedItem == 5 ? -5 : 5;
              });
            },
          ),

          const SizedBox(height: AppSizes.spaceBetweenItems),

          AppElevatedButton(
            label: "Done",
            onPressed: () {
              context.pop();
            },
          ),

          const SizedBox(height: AppSizes.spaceBetweenItems),
        ],
      ),
    );
  }
}

class ShareSheet extends StatefulWidget {
  const ShareSheet({
    super.key,
  });

  @override
  State<ShareSheet> createState() => _ShareSheetState();
}

class _ShareSheetState extends State<ShareSheet> {
  Set<int> selectedItem = <int>{};

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Share Post", style: context.txtTheme.titleMedium),
          const SizedBox(height: AppSizes.spaceBetweenItems),

          AppTextField(
            controller: TextEditingController(),
            labelText: 'Search',
          ),

          const SizedBox(height: AppSizes.spaceBetweenItems),

          ListTile(
            leading: const ClipOval(
              child: ImageLoader(
                height: 40,
                width: 40,
                imagePath:
                    "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
              ),
            ),
            title: const Text("John Doe"),
            trailing: Checkbox(
              value: selectedItem.contains(1),
              onChanged: (bool? value) {
                if (value != null && value) {
                  setState(() {
                    !selectedItem.contains(1)
                        ? selectedItem.add(1)
                        : selectedItem.remove(1);
                  });
                }
              },
            ),
            onTap: () {
              setState(() {
                !selectedItem.contains(1)
                    ? selectedItem.add(1)
                    : selectedItem.remove(1);
              });
            },
          ),
          ListTile(
            leading: const ClipOval(
              child: ImageLoader(
                height: 40,
                width: 40,
                imagePath:
                    "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
              ),
            ),
            title: const Text("John Smith"),
            trailing: Checkbox(
              value: selectedItem.contains(2),
              onChanged: (bool? value) {
                if (value != null && value) {
                  setState(() {
                    !selectedItem.contains(2)
                        ? selectedItem.add(2)
                        : selectedItem.remove(2);
                  });
                }
              },
            ),
            onTap: () {
              setState(() {
                !selectedItem.contains(2)
                    ? selectedItem.add(2)
                    : selectedItem.remove(2);
              });
            },
          ),

          const SizedBox(height: AppSizes.spaceBetweenItems),

          AppElevatedButton(
            label: "Send",
            onPressed: () {
              context.pop();
            },
          ),

          const SizedBox(height: AppSizes.spaceBetweenItems),
        ],
      ),
    );
  }
}

class CommentSheet extends StatefulWidget {
  const CommentSheet({
    super.key,
  });

  @override
  State<CommentSheet> createState() => _CommentSheetState();
}

class _CommentSheetState extends State<CommentSheet> {
  Set<int> selectedItem = <int>{};

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: AppSizes.spaceBetweenItems),

          const CommentCard(),
          const SizedBox(height: AppSizes.spaceBetweenItems),
          const CommentCard(),
          const SizedBox(height: AppSizes.spaceBetweenItems),
          const CommentCard(),
          const SizedBox(height: AppSizes.spaceBetweenItems),

          const SizedBox(height: 32),

          AppTextField(
            controller: TextEditingController(),
            labelText: "Type a comment...",
            minLines: 3,
            maxLines: 5,
            suffixIcon: GestureDetector(
              onTap: () {
                // Handle send comment action
              },
              child: const Icon(Icons.send, color: AppColors.primary),
            ),
          ),

          Container(),
        ],
      ),
    );
  }
}

class CommentCard extends StatelessWidget {
  const CommentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        GestureDetector(
          onTap: () => context.push(
            RoutePaths.imageFullScreen,
            extra: <String, String>{
              "imagePath":
                  "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
            },
          ),
          child: const ClipOval(
            child: ImageLoader(
              imagePath:
                  "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
              width: 40,
              height: 40,
            ),
          ),
        ),
        const SizedBox(
          width: AppSizes.sm,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.sm,
            vertical: AppSizes.sm,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: AppColors.grey, width: 1.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Shohan",
                style: context.txtTheme.bodyLarge,
              ),
              Text(
                "Nice post! Really enjoyed reading it.",
                style: context.txtTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
