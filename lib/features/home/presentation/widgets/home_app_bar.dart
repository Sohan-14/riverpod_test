import 'package:app/core/config/sizes.dart';
import 'package:app/core/extensions/context_extensions.dart';
import 'package:app/core/navigation/route_paths.dart';
import 'package:app/core/shared/widgets/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/config/icons.dart';
import '../../../../core/shared/provider/role_provider.dart';
import '../../../../core/shared/widgets/app_text_field.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(width: 8.0),
          GestureDetector(
            onTap: () => context.push(RoutePaths.postStory),
            child: Stack(
              children: <Widget>[
                const ClipOval(
                  child: ImageLoader(
                    imagePath:
                        "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
                    height: 60,
                    width: 60,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 12.0,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),

          SizedBox(
            width: context.screenWidth * 0.6,
            child: AppTextField(
              controller: TextEditingController(),
              labelText: 'Search',
            ),
          ),
          const Spacer(),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final AsyncValue<Role> roleAsync = ref.watch(
                selectedRoleProvider,
              );

              final Role? role =
                  roleAsync.value; 
              if (role == Role.driver) {
                return GestureDetector(
                  onTap: () => context.push(RoutePaths.parcelRequest),
                  child: const ImageLoader(
                    imagePath: AppIcons.parcelRequest,
                    height: 24,
                    width: 24,
                  ),
                );
              }

              return const SizedBox.shrink();
            },
          ),
          GestureDetector(
            onTap: () => context.push(RoutePaths.notification),
            child: const ImageLoader(
              imagePath: AppIcons.notification,
              height: 24,
              width: 24,
            ),
          ),
          const SizedBox(
            width: AppSizes.sm,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
