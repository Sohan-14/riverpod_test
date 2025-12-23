import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/icons.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/widget_extensions.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/provider/role_provider.dart';
import '../../../../core/shared/widgets/app_elevated_button.dart';
import '../../../../core/shared/widgets/app_outline_button.dart';
import '../../../../core/shared/widgets/image_loader.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.md,
        vertical: AppSizes.lg,
      ),
      decoration: BoxDecoration(
        color: AppColors.silver,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const ClipOval(
            child: ImageLoader(
              imagePath:
                  "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
              width: 160,
              height: 160,
            ),
          ).centered,

          const SizedBox(
            height: AppSizes.spaceBetweenSections,
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Zahidul Islam Shohan",
                style: context.txtTheme.bodyLarge,
              ),
              Text(
                "50 followers",
                style: context.txtTheme.bodyMedium?.copyWith(
                  color: AppColors.grey,
                ),
              ),
              Text(
                "20 following",
                style: context.txtTheme.bodyMedium?.copyWith(
                  color: AppColors.grey,
                ),
              ),
            ],
          ),

          const SizedBox(
            height: AppSizes.md,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: context.screenWidth * .4,
                height: 40,
                child: const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ClipOval(
                        child: ImageLoader(
                          imagePath:
                              "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
                          width: 30,
                          height: 30,
                        ),
                      ),
                      ClipOval(
                        child: ImageLoader(
                          imagePath:
                              "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
                          width: 30,
                          height: 30,
                        ),
                      ),
                      ClipOval(
                        child: ImageLoader(
                          imagePath:
                              "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
                          width: 30,
                          height: 30,
                        ),
                      ),
                      ClipOval(
                        child: ImageLoader(
                          imagePath:
                              "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AppOutlineButton(
                width: 100,
                icon: const Icon(
                  Icons.edit,
                  color: AppColors.primary,
                ),
                onPressed: () {
                  context.push(RoutePaths.profileEdit);
                },
                label: "Edit",
                outlineColor: AppColors.primary,
              ),
            ],
          ),

          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              // ✅ Watch the full state object
              final Role? role = ref.watch(selectedRoleProvider).value;

              if (role == Role.creator) {
                return Column(
                  children: <Widget>[
                    const SizedBox(height: AppSizes.spaceBetweenItems),
                    AppElevatedButton(
                      icon: const ImageLoader(
                        imagePath: AppIcons.advertise,
                        width: 24.0,
                        height: 24.0,
                        color: AppColors.white,
                      ),
                      onPressed: () => context.push(RoutePaths.ads),
                      label: "Advertise",
                    ),
                  ],
                );
              } else if (role == Role.seller) {
                return Column(
                  children: <Widget>[
                    const SizedBox(height: AppSizes.spaceBetweenItems),
                    AppElevatedButton(
                      icon: const ImageLoader(
                        imagePath: AppIcons.order,
                        width: 24.0,
                        height: 24.0,
                        color: AppColors.white,
                      ),
                      onPressed: () => context.push(RoutePaths.productOrders),
                      label: "Orders",
                    ),
                  ],
                );
              } else if (role == Role.driver) {
                return Column(
                  children: <Widget>[
                    const SizedBox(height: AppSizes.spaceBetweenItems),
                    AppElevatedButton(
                      icon: const ImageLoader(
                        imagePath: AppIcons.parcelRequest,
                        width: 24.0,
                        height: 24.0,
                        color: AppColors.white,
                      ),
                      onPressed: () => context.push(RoutePaths.parcelRequest),
                      label: "Request",
                    ),
                  ],
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
